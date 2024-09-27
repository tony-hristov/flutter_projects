package com.example.greenlight_plugin

/**
 * Holds theme data as received from Flutter:
 *
 * ```
 * {
 *      "colors": {
 *          "primary": {
 *              "red": 150,
 *              "green": 15,
 *              "blue": 15,
 *              "alpha": 255
 *          },
 *          "onPrimary": {
 *              "red": 255,
 *              "green": 255,
 *              "blue": 255,
 *              "alpha": 255
 *          },
 *          ...
 *      },
 *      "shapes": {
 *          "cardShape": {
 *              "cornerRadius": 4
 *          },
 *          "buttonShape": {
 *              "cornerRadius": 4
 *          },
 *          "inputBoxShape": {
 *              "cornerRadius": 4
 *          }
 *      }
 * }
 * ```
 *
 */
typealias ThemeDataType = Map<String, Map<String, Map<String, *>>>