import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:real_estate3_a/features/payment/presentation/screens/payment_success_screen.dart';

class PaymentScreen extends StatefulWidget {
  final String url;

  const PaymentScreen({super.key, required this.url});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _initializeWebView();
  }

  void _initializeWebView() async {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            if (progress == 100) {
              if (mounted) {
                setState(() => _isLoading = false);
              }
            }
          },
          onPageStarted: (String url) {
            if (mounted) {
              setState(() {
                _isLoading = true;
                _errorMessage = null;
              });
            }
            _checkPaymentSuccess(url);
          },
          onPageFinished: (String url) {
            if (mounted) {
              setState(() => _isLoading = false);
            }
            _checkPaymentSuccess(url);
          },
          onWebResourceError: (WebResourceError error) {
            if (mounted) {
              setState(() {
                _errorMessage = 'Failed to load page: ${error.description}';
                _isLoading = false;
              });
            }
          },
        ),
      );

    try {
      await _controller.loadRequest(Uri.parse(widget.url));
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = 'Failed to load payment page: $e';
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // go to home screen
          },
        ),
        title: const Text('Payment Gateway'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Stack(
        children: [
          if (_isLoading)
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading payment page...'),
                ],
              ),
            ),
          if (_errorMessage != null)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 48,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _errorMessage!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => _retryLoading(),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          WebViewWidget(controller: _controller),
        ],
      ),
    );
  }

  void _checkPaymentSuccess(String url) {
    // Check for common Stripe success URL patterns
    // Adjust these patterns based on your actual success redirect URLs
    if (url.contains('success') ||
        url.contains('payment_success') ||
        url.contains('checkout/success') ||
        url.contains('thank-you')) {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const PaymentSuccessScreen()),
        );
      }
    }
  }

  void _retryLoading() {
    setState(() {
      _errorMessage = null;
      _isLoading = true;
    });
    _initializeWebView();
  }

  @override
  void dispose() {
    _controller.clearCache();
    super.dispose();
  }
}
