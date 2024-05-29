import 'package:flutter/material.dart';

import '../../../../core/app_constants/color_constant.dart';

Widget getCreditCardForm() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
      child: Column(
        children: [
          // Изображение карты
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage('assets/images/credit_card.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Поля ввода
          TextField(
            decoration: InputDecoration(
              icon: const Icon(Icons.credit_card),
              iconColor: Colors.white,
              labelText: 'Номер карты',
              labelStyle: const TextStyle(color: Colors.white),
              filled: true,
              fillColor: Colors.grey[800],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              icon: const Icon(Icons.account_circle_outlined),
              iconColor: Colors.white,
              labelText: 'Имя держателя карты',
              labelStyle: const TextStyle(color: Colors.white),
              filled: true,
              fillColor: Colors.grey[800],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    icon: const Icon(Icons.date_range_outlined),
                    iconColor: Colors.white,
                    labelText: 'Срок карты',
                    labelStyle: const TextStyle(color: Colors.white),
                    hintText: 'MM/YY',
                    hintStyle: const TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.grey[800],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    icon: const Icon(Icons.password),
                    iconColor: Colors.white,
                    labelText: 'CVV / CVC',
                    labelStyle: const TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.grey[800],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  obscureText: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Логика добавления карты
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16), backgroundColor: ColorConstant.orangeColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ), // Цвет кнопки
            ),
            child: const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.paypal, color: Colors.white,),
                  SizedBox(width: 10),
                  Text(
                    'Оплатить',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}