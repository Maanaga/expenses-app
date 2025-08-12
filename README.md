# iExpense

A modern expense tracking app built with SwiftUI that helps you manage your personal and business expenses with ease.

## Features

- **Native iOS Experience**: Built with SwiftUI for a smooth, native iOS interface
- **Dark Mode**: Sleek dark theme for comfortable viewing
- **Expense Categories**: Separate tracking for Personal and Business expenses
- **Multi-Currency Support**: Track expenses in USD and EUR
- **Persistent Storage**: Automatic data persistence using UserDefaults
- **Color-Coded Amounts**: Visual expense categorization by amount ranges
  - Red: Under $10
  - Yellow: $10 - $100
  - Green: Over $100
- **Easy Management**: Add, view, and delete expenses with intuitive gestures

## Screenshots

*Screenshots coming soon*

## Requirements

- iOS 15.0+
- Xcode 13.0+
- Swift 5.5+

## Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/iExpense.git
```

2. Open the project in Xcode:
```bash
cd iExpense
open iExpense.xcodeproj
```

3. Build and run the project on your device or simulator.

## Usage

### Adding an Expense
1. Tap the "+" button in the navigation bar
2. Enter the expense name
3. Select the type (Personal or Business)
4. Choose your preferred currency (USD or EUR)
5. Enter the amount
6. Tap "Save" to add the expense

### Viewing Expenses
- Expenses are automatically organized into Personal and Business sections
- Each expense shows the name, type, amount, and currency
- Color coding helps you quickly identify expense ranges

### Deleting Expenses
- Swipe left on any expense item to delete it
- The app automatically updates and saves your changes

## Architecture

The app follows SwiftUI best practices with a clean, modular architecture:

### Key Components

- **ContentView**: Main view displaying expense lists with sections
- **AddView**: Form view for adding new expenses
- **ExpenseItem**: Data model representing individual expenses
- **Expenses**: Observable class managing expense data with persistence

### Data Persistence

The app uses UserDefaults with JSON encoding/decoding to persist expense data across app launches, ensuring your data is always saved.

## Code Structure

```
iExpense/
├── ContentView.swift          # Main expense list view
├── AddView.swift             # Add expense form view
└── Models/
    ├── ExpenseItem.swift     # Expense data model
    └── Expenses.swift        # Expense management class
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

### Development Setup

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Future Enhancements

- [ ] More currency options
- [ ] Expense categories beyond Personal/Business
- [ ] Data export functionality
- [ ] Charts and analytics
- [ ] iCloud sync
- [ ] Receipt photo attachments
- [ ] Search and filtering
- [ ] Expense reports

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Built following the Hacking with Swift SwiftUI tutorial series
- Icons provided by SF Symbols
- SwiftUI framework by Apple

## Contact

Luka Managadze - [your.email@example.com](mailto:your.email@example.com)

Project Link: [https://github.com/yourusername/iExpense](https://github.com/yourusername/iExpense)

---

Star this repo if you found it helpful!
