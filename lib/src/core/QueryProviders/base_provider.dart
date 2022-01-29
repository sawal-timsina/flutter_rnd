abstract class BaseProvider<T extends dynamic> {
  BaseProvider();

  Future refetch();

  void clearCache();

  void revalidateCache();
}
