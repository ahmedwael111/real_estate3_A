import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImageWidget extends StatefulWidget {
  final String? imageUrl;
  final BoxFit fit;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final Duration cacheExpiration;
  final VoidCallback? onError;
  final Widget? fallbackWidget;
  final bool enableRetry;

  const CachedImageWidget({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.borderRadius,
    this.cacheExpiration = const Duration(days: 7),
    this.onError,
    this.fallbackWidget,
    this.enableRetry = true,
  });

  @override
  State<CachedImageWidget> createState() => _CachedImageWidgetState();
}

class _CachedImageWidgetState extends State<CachedImageWidget> {
  bool _hasError = false;
  int _retryCount = 0;
  final int _maxRetries = 3;
  String? _errorMessage;

  bool get _isValidUrl {
    if (widget.imageUrl == null) return false;

    final url = widget.imageUrl!.trim();

    if (url.isEmpty) return false;

    // Check if URL has valid format
    final uri = Uri.tryParse(url);
    if (uri == null) return false;

    // Verify it's an absolute URL with http/https
    if (!uri.hasAbsolutePath ||
        (uri.scheme != 'http' && uri.scheme != 'https')) {
      return false;
    }

    return true;
  }

  void _handleError(String error) {
    print('[CachedImageWidget] ❌ Error loading image: $error');
    print('[CachedImageWidget] URL: ${widget.imageUrl}');
    print('[CachedImageWidget] Retry: $_retryCount/$_maxRetries');

    setState(() {
      _hasError = true;
      _errorMessage = error;
    });

    widget.onError?.call();
  }

  void _retry() {
    if (_retryCount < _maxRetries) {
      setState(() {
        _hasError = false;
        _retryCount++;
        _errorMessage = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isValidUrl) {
      print('[CachedImageWidget] ❌ Invalid URL detected: ${widget.imageUrl}');
      return _buildErrorWidget(reason: 'Invalid URL');
    }

    if (_hasError) {
      return _buildErrorWidget(reason: _errorMessage);
    }

    return ClipRRect(
      borderRadius: widget.borderRadius ?? BorderRadius.zero,
      child: CachedNetworkImage(
        imageUrl: widget.imageUrl ?? "",
        fit: widget.fit,
        width: widget.width,
        height: widget.height,
        // cacheManager: CacheManagerProvider.cacheManager,

        // Placeholder while loading
        placeholder: (context, url) => Container(
          width: widget.width,
          height: widget.height,
          color: Colors.grey.shade200,
          child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
        ),

        // Error handling with better details
        errorWidget: (context, url, error) {
          final errorMsg = error.toString();
          print('[CachedImageWidget] ❌ Load error: $errorMsg');

          // Extract 404 or status code from error
          if (errorMsg.contains('404')) {
            _handleError('Image not found (404)');
          } else if (errorMsg.contains('Invalid statusCode')) {
            _handleError('Server returned invalid status');
          } else {
            _handleError(errorMsg);
          }

          return _buildErrorWidget(reason: _errorMessage);
        },

        // Network headers for better compatibility
        httpHeaders: const {
          'User-Agent':
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
          'Accept': 'image/webp,image/apng,image/*,*/*;q=0.8',
          'Accept-Language': 'en-US,en;q=0.9',
          'Accept-Encoding': 'gzip, deflate, br',
          'Connection': 'keep-alive',
        },

        fadeInDuration: const Duration(milliseconds: 300),
        fadeOutDuration: const Duration(milliseconds: 200),
      ),
    );
  }

  Widget _buildErrorWidget({String? reason}) {
    // Use custom fallback widget if provided
    if (widget.fallbackWidget != null) {
      return widget.fallbackWidget!;
    }

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: widget.borderRadius ?? BorderRadius.zero,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image_not_supported_outlined,
            color: Colors.grey.shade600,
            size: 40,
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              reason ?? 'Image unavailable',
              style: TextStyle(color: Colors.grey.shade600, fontSize: 11),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (widget.enableRetry && _retryCount < _maxRetries)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: GestureDetector(
                onTap: _retry,
                child: Text(
                  'Retry',
                  style: TextStyle(
                    color: Colors.blue.shade600,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// Cache manager provider for consistent caching
// class CacheManagerProvider {
//   static final CacheManager cacheManager = CacheManager(
//     Config(
//       'imageCache',
//       stalePeriod: const Duration(days: 7),
//       maxNrOfCacheObjects: 200,
//       fileService: FileService(),
//     ),
//   );
// }

// // Simple file service - can be extended for custom logic
// class FileService {
//   @override
//   Future<FileServiceResponse> get(
//     String url, {
//     Map<String, String>? headers,
//     bool withProgress = false,
//     Function(int, int?)? onProgress,
//   }) async {
//     try {
//       final httpClient = ImageHttpClient().httpClient;
//       final request = await httpClient.getUrl(Uri.parse(url));

//       // Add custom headers
//       request.headers.addAll(headers ?? {});

//       final response = await request.close();

//       print('[FileService] Response status: ${response.statusCode} for $url');

//       if (response.statusCode != 200) {
//         throw HttpException(
//           'Invalid statusCode: ${response.statusCode}',
//           uri: Uri.parse(url),
//         );
//       }

//       return FileServiceResponse(
//         response.statusCode,
//         response.contentLength,
//         response,
//         DateTime.now().add(const Duration(days: 7)),
//       );
//     } catch (e) {
//       print('[FileService] Error: $e');
//       rethrow;
//     }
// }
// }
