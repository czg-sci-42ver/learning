// #define CLASS_LOADER_REGISTER_CLASS_INTERNAL_WITH_MESSAGE(Derived, Base,       \
//                                                           UniqueID, Message)   \
//   namespace {                                                                  \
//   struct ProxyExec##UniqueID {                                                 \
//     typedef Derived _derived;                                                  \
//     typedef Base _base;                                                        \
//     ProxyExec##UniqueID() {                                                    \
//       if (!std::string(Message).empty()) {                                     \
//         CONSOLE_BRIDGE_logInform("%s", Message);                               \
//       }                                                                        \
//       class_loader::impl::registerPlugin<_derived, _base>(#Derived, #Base);    \
//     }                                                                          \
//   };                                                                           \
//   static ProxyExec##UniqueID g_register_plugin_##UniqueID;                     \
//   }
// void main() {
//   CLASS_LOADER_REGISTER_CLASS_INTERNAL_WITH_MESSAGE
//     }