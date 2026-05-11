# Payment Feature

This feature implements the `createOrder` function using clean architecture pattern.

## Architecture

### Data Layer
- **Models**: `OrderModel`, `PropertyModel`, `CategoryModel`, `AgentModel`
- **Data Source**: `PaymentRemoteDataSourceImpl` using existing `DioHelper`
- **Repository**: `PaymentRepositoryImpl`

### Domain Layer
- **Entities**: `OrderEntity`, `PropertyEntity`, `CategoryEntity`, `AgentEntity`
- **Repository Interface**: `PaymentRepository`
- **Use Case**: `CreateOrderUseCase`

### Presentation Layer
- **Cubit**: `PaymentCubit` with fold method pattern
- **States**: `PaymentInitial`, `PaymentLoading`, `PaymentLoaded`, `PaymentError`

## Usage

### 1. Initialize the payment module in main.dart:

```dart
import 'package:real_estate3_a/features/payment/di/payment_di.dart';

Future<void> main() async {
  await initAppModule();
  await initPaymentModule(); // Add this line
  runApp(MyApp());
}
```

### 2. Use the PaymentCubit in your screen:

```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate3_a/core/di.dart';
import 'package:real_estate3_a/features/payment/presentation/cubit/payment_cubit.dart';

class YourScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PaymentCubit>(),
      child: YourWidget(),
    );
  }
}
```

### 3. Create an order:

```dart
context.read<PaymentCubit>().createOrder(propertyId);
```

### 4. Listen to state changes:

```dart
BlocBuilder<PaymentCubit, PaymentState>(
  builder: (context, state) {
    return state.fold(
      () => Text('Initial state'),
      (loading) => CircularProgressIndicator(),
      (order) => Text('Order created: ${order.id}'),
      (error) => Text('Error: ${error.message}'),
    );
  },
)
```

## API Response Model

The `createOrder` function expects the following response structure:

```json
{
  "data": {
    "order": {
      "id": 69,
      "amount": "250000.00",
      "currency": "usd",
      "status": "pending",
      "stripe_checkout_session_id": "cs_test_a1AF4TNZbfrYwKmyLHQHItjS68cL06OSFY8zcpQFyqEePunr9f4TKzuCAZ",
      "created_at": "2026-05-06T16:03:13.000000Z",
      "property": { ... }
    },
    "payment_url": "https://checkout.stripe.com/c/pay/..."
  }
}
```

## Dependencies

- `dartz` for Either pattern
- `equatable` for entity comparison
- `flutter_bloc` for state management
- `dio` for HTTP requests (via existing DioHelper)
