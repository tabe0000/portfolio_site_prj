class PortfolioData {
  //common property
  String name;
  String usingTechnology;
  int downloads;

  //state is card.
  String comment;
  String thumbnailImagePath;

  //expanded card.
  String description;
  String descriptionImagePath;
  String programingLanguageUsed;
  String supporterdPlatform;
  String playStoreLink;
  String appStoreLink;

  PortfolioData(this.name, this.usingTechnology, this.downloads, this.comment,
  this.thumbnailImagePath, this.description, this.descriptionImagePath, this.programingLanguageUsed,
  this.supporterdPlatform, this.playStoreLink, this.appStoreLink);
}
