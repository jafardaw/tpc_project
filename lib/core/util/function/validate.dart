String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'الرجاء إدخال البريد الإلكتروني';
  }
  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
    return 'بريد إلكتروني غير صالح';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'الرجاء إدخال كلمة المرور';
  }
  if (value.length < 6) {
    return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
  }
  return null;
}

String? validateConfirmPassword(String? value, String password) {
  if (value == null || value.isEmpty) {
    return 'الرجاء تأكيد كلمة المرور';
  }
  if (value != password) {
    return 'كلمتا المرور غير متطابقتين';
  }
  return null;
}

String? validateName(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'الرجاء إدخال الاسم';
  }
  if (value.length < 2) {
    return 'الاسم قصير جداً';
  }
  return null;
}

String? validatePhone(String? value) {
  if (value == null || value.isEmpty) {
    return 'الرجاء إدخال رقم الهاتف';
  }
  if (!RegExp(r'^\+?[0-9]{9,15}$').hasMatch(value)) {
    return 'رقم الهاتف غير صالح';
  }
  return null;
}

String? validateRequired(String? value, [String fieldName = 'هذا الحقل']) {
  if (value == null || value.trim().isEmpty) {
    return 'الرجاء إدخال $fieldName';
  }
  return null;
}

String? validateQuantity(String? value) {
  if (value == null || value.isEmpty) {
    return 'الرجاء إدخال الكمية';
  }
  final quantity = double.tryParse(value);
  if (quantity == null) {
    return 'يجب أن تكون الكمية رقماً';
  }
  if (quantity <= 0) {
    return 'يجب أن تكون الكمية أكبر من الصفر';
  }
  return null;
}

String? validatePrice(String? value) {
  if (value == null || value.isEmpty) {
    return 'الرجاء إدخال السعر';
  }
  final price = double.tryParse(value);
  if (price == null) {
    return 'يجب أن يكون السعر رقماً';
  }
  if (price <= 0) {
    return 'يجب أن يكون السعر أكبر من الصفر';
  }
  return null;
}

String? validateRealCost(String? value) {
  if (value == null || value.isEmpty) {
    return 'الرجاء إدخال التكلفة الحقيقية';
  }
  final cost = double.tryParse(value);
  if (cost == null) {
    return 'يجب أن تكون التكلفة رقماً';
  }
  if (cost < 0) {
    return 'لا يمكن أن تكون التكلفة سلبية';
  }
  return null;
}

String? validateEstimatedCost(String? value) {
  if (value == null || value.isEmpty) {
    return 'الرجاء إدخال التكلفة التقديرية';
  }
  final cost = double.tryParse(value);
  if (cost == null) {
    return 'يجب أن تكون التكلفة رقماً';
  }
  if (cost < 0) {
    return 'لا يمكن أن تكون التكلفة سلبية';
  }
  return null;
}

String? validateDate(String? value) {
  if (value == null || value.isEmpty) {
    return 'الرجاء إدخال التاريخ';
  }
  if (!RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(value)) {
    return 'الصيغة الصحيحة: YYYY-MM-DD';
  }
  return null;
}

String? validatePercentage(String? value) {
  if (value == null || value.isEmpty) {
    return 'الرجاء إدخال النسبة';
  }
  final percentage = double.tryParse(value);
  if (percentage == null) {
    return 'يجب أن تكون النسبة رقماً';
  }
  if (percentage < 0 || percentage > 100) {
    return 'يجب أن تكون النسبة بين 0 و 100';
  }
  return null;
}
