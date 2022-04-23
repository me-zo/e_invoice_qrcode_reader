abstract class Repository<TEntity> {
  List<TEntity> getAll();

  TEntity getById();

  void insert();

  void update();

  void delete();
}
