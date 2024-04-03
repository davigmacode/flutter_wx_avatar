[![Pub Version](https://img.shields.io/pub/v/wx_avatar)](https://pub.dev/packages/wx_avatar) ![GitHub](https://img.shields.io/github/license/davigmacode/flutter_wx_avatar) [![GitHub](https://badgen.net/badge/icon/buymeacoffee?icon=buymeacoffee&color=yellow&label)](https://www.buymeacoffee.com/davigmacode) [![GitHub](https://badgen.net/badge/icon/ko-fi?icon=kofi&color=red&label)](https://ko-fi.com/davigmacode)

Provides an intuitive and developer-friendly API, allowing you to effortlessly tailor avatars to your exact requirements.

[![Preview](https://github.com/davigmacode/flutter_wx_avatar/raw/main/media/preview.jpg)](https://davigmacode.github.io/flutter_wx_avatar)

[Demo](https://davigmacode.github.io/flutter_wx_avatar)

## Usage

To read more about classes and other references used by `wx_avatar`, see the [API Reference](https://pub.dev/documentation/wx_avatar/latest/).

```dart
Wrap(
  spacing: 20,
  children: [
    const WxAvatar(
      image: NetworkImage('https://i.pravatar.cc/50?u=2'),
    ),
    const WxAvatar(
      elevation: 3.0,
      backgroundColor: Colors.red,
      foregroundStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.amber,
      ),
      child: Text('Wx'),
    ),
    WxAvatar(
      borderStyle: BorderStyle.solid,
      borderColor: Colors.black54,
      borderWidth: 2,
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Colors.black87,
      foregroundSize: 40,
      child: const Icon(Icons.person),
    ),
  ],
)

Wrapper(
  title: 'Circle Shape',
  child: Wrap(
    spacing: 20,
    children: [
      const WxAvatar.circle(
        image: NetworkImage('https://i.pravatar.cc/50?u=2'),
      ),
      const WxAvatar.circle(
        elevation: 3.0,
        backgroundColor: Colors.red,
        child: Text('Wx'),
      ),
      WxAvatar.circle(
        borderStyle: BorderStyle.solid,
        borderColor: Colors.black54,
        borderWidth: 2,
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Colors.black87,
        foregroundSize: 30,
        child: const Icon(Icons.person),
      ),
    ],
  ),
)
```

## Sponsoring

<a href="https://www.buymeacoffee.com/davigmacode" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" height="45"></a>
<a href="https://ko-fi.com/davigmacode" target="_blank"><img src="https://storage.ko-fi.com/cdn/brandasset/kofi_s_tag_white.png" alt="Ko-Fi" height="45"></a>

If this package or any other package I created is helping you, please consider to sponsor me so that I can take time to read the issues, fix bugs, merge pull requests and add features to these packages.