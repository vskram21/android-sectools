.class Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "RepoCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/gitrepo/RepoCommand;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "XmlManifest"
.end annotation


# instance fields
.field private final baseUrl:Ljava/lang/String;

.field private final command:Lorg/eclipse/jgit/gitrepo/RepoCommand;

.field private currentProject:Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;

.field private defaultRemote:Ljava/lang/String;

.field private defaultRevision:Ljava/lang/String;

.field private final filename:Ljava/lang/String;

.field private final minusGroups:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final plusGroups:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final projects:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;",
            ">;"
        }
    .end annotation
.end field

.field private final remotes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/gitrepo/RepoCommand;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .parameter "command"
    .parameter "filename"
    .parameter "baseUrl"
    .parameter "groups"

    .prologue
    .line 266
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 267
    iput-object p1, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->command:Lorg/eclipse/jgit/gitrepo/RepoCommand;

    .line 268
    iput-object p2, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->filename:Ljava/lang/String;

    .line 269
    iput-object p3, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->baseUrl:Ljava/lang/String;

    .line 270
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    iput-object v4, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->remotes:Ljava/util/Map;

    .line 271
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->projects:Ljava/util/List;

    .line 272
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    iput-object v4, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->plusGroups:Ljava/util/Set;

    .line 273
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    iput-object v4, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->minusGroups:Ljava/util/Set;

    .line 274
    if-eqz p4, :cond_0

    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_0

    const-string v4, "default"

    invoke-virtual {p4, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 276
    :cond_0
    iget-object v4, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->minusGroups:Ljava/util/Set;

    const-string v5, "notdefault"

    invoke-interface {v4, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 285
    :cond_1
    return-void

    .line 278
    :cond_2
    const-string v4, ","

    invoke-virtual {p4, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .local v0, arr$:[Ljava/lang/String;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v1, v0, v2

    .line 279
    .local v1, group:Ljava/lang/String;
    const-string v4, "-"

    invoke-virtual {v1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 280
    iget-object v4, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->minusGroups:Ljava/util/Set;

    const/4 v5, 0x1

    invoke-virtual {v1, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 278
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 282
    :cond_3
    iget-object v4, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->plusGroups:Ljava/util/Set;

    invoke-interface {v4, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method


# virtual methods
.method public endDocument()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v9, 0x0

    .line 352
    iget-object v5, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->defaultRemote:Ljava/lang/String;

    if-nez v5, :cond_0

    .line 353
    new-instance v5, Lorg/xml/sax/SAXException;

    invoke-static {}, Lorg/eclipse/jgit/gitrepo/internal/RepoText;->get()Lorg/eclipse/jgit/gitrepo/internal/RepoText;

    move-result-object v6

    iget-object v6, v6, Lorg/eclipse/jgit/gitrepo/internal/RepoText;->errorNoDefault:Ljava/lang/String;

    new-array v7, v7, [Ljava/lang/Object;

    iget-object v8, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->filename:Ljava/lang/String;

    aput-object v8, v7, v9

    invoke-static {v6, v7}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/xml/sax/SAXException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 358
    :cond_0
    :try_start_0
    new-instance v4, Ljava/net/URI;

    const-string v5, "%s/%s/"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    iget-object v8, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->baseUrl:Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x1

    iget-object v8, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->remotes:Ljava/util/Map;

    iget-object v9, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->defaultRemote:Ljava/lang/String;

    invoke-interface {v8, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 359
    .local v4, uri:Ljava/net/URI;
    invoke-virtual {v4}, Ljava/net/URI;->normalize()Ljava/net/URI;

    move-result-object v5

    invoke-virtual {v5}, Ljava/net/URI;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 363
    .local v3, remoteUrl:Ljava/lang/String;
    iget-object v5, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->projects:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;

    .line 364
    .local v2, proj:Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;
    invoke-virtual {p0, v2}, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->inGroups(Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 365
    iget-object v6, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->command:Lorg/eclipse/jgit/gitrepo/RepoCommand;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v7, v2, Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;->name:Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iget-object v8, v2, Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;->path:Ljava/lang/String;

    iget-object v5, v2, Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;->revision:Ljava/lang/String;

    if-nez v5, :cond_2

    iget-object v5, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->defaultRevision:Ljava/lang/String;

    :goto_1
    iget-object v9, v2, Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;->copyfiles:Ljava/util/List;

    #calls: Lorg/eclipse/jgit/gitrepo/RepoCommand;->addSubmodule(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    invoke-static {v6, v7, v8, v5, v9}, Lorg/eclipse/jgit/gitrepo/RepoCommand;->access$200(Lorg/eclipse/jgit/gitrepo/RepoCommand;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    goto :goto_0

    .line 360
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v2           #proj:Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;
    .end local v3           #remoteUrl:Ljava/lang/String;
    .end local v4           #uri:Ljava/net/URI;
    :catch_0
    move-exception v0

    .line 361
    .local v0, e:Ljava/net/URISyntaxException;
    new-instance v5, Lorg/xml/sax/SAXException;

    invoke-direct {v5, v0}, Lorg/xml/sax/SAXException;-><init>(Ljava/lang/Exception;)V

    throw v5

    .line 365
    .end local v0           #e:Ljava/net/URISyntaxException;
    .restart local v1       #i$:Ljava/util/Iterator;
    .restart local v2       #proj:Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;
    .restart local v3       #remoteUrl:Ljava/lang/String;
    .restart local v4       #uri:Ljava/net/URI;
    :cond_2
    iget-object v5, v2, Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;->revision:Ljava/lang/String;

    goto :goto_1

    .line 372
    .end local v2           #proj:Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;
    :cond_3
    return-void
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .parameter "uri"
    .parameter "localName"
    .parameter "qName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 344
    const-string v0, "project"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 345
    iget-object v0, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->projects:Ljava/util/List;

    iget-object v1, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->currentProject:Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 346
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->currentProject:Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;

    .line 348
    :cond_0
    return-void
.end method

.method inGroups(Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;)Z
    .locals 6
    .parameter "proj"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 375
    iget-object v4, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->minusGroups:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 376
    .local v0, group:Ljava/lang/String;
    iget-object v4, p1, Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;->groups:Ljava/util/Set;

    invoke-interface {v4, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 389
    .end local v0           #group:Ljava/lang/String;
    :cond_1
    :goto_0
    return v2

    .line 381
    :cond_2
    iget-object v4, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->plusGroups:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3

    iget-object v4, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->plusGroups:Ljava/util/Set;

    const-string v5, "all"

    invoke-interface {v4, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    :cond_3
    move v2, v3

    .line 383
    goto :goto_0

    .line 385
    :cond_4
    iget-object v4, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->plusGroups:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_5
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 386
    .restart local v0       #group:Ljava/lang/String;
    iget-object v4, p1, Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;->groups:Ljava/util/Set;

    invoke-interface {v4, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    move v2, v3

    .line 387
    goto :goto_0
.end method

.method read()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 290
    :try_start_0
    invoke-static {}, Lorg/xml/sax/helpers/XMLReaderFactory;->createXMLReader()Lorg/xml/sax/XMLReader;
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 294
    .local v3, xr:Lorg/xml/sax/XMLReader;
    invoke-interface {v3, p0}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 295
    new-instance v2, Ljava/io/FileInputStream;

    iget-object v4, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->filename:Ljava/lang/String;

    invoke-direct {v2, v4}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 297
    .local v2, in:Ljava/io/FileInputStream;
    :try_start_1
    new-instance v4, Lorg/xml/sax/InputSource;

    invoke-direct {v4, v2}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    invoke-interface {v3, v4}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Lorg/xml/sax/SAXException; {:try_start_1 .. :try_end_1} :catch_1

    .line 304
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    .line 306
    return-void

    .line 291
    .end local v2           #in:Ljava/io/FileInputStream;
    .end local v3           #xr:Lorg/xml/sax/XMLReader;
    :catch_0
    move-exception v0

    .line 292
    .local v0, e:Lorg/xml/sax/SAXException;
    new-instance v4, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->noXMLParserAvailable:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 298
    .end local v0           #e:Lorg/xml/sax/SAXException;
    .restart local v2       #in:Ljava/io/FileInputStream;
    .restart local v3       #xr:Lorg/xml/sax/XMLReader;
    :catch_1
    move-exception v0

    .line 299
    .restart local v0       #e:Lorg/xml/sax/SAXException;
    :try_start_2
    new-instance v1, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/gitrepo/internal/RepoText;->get()Lorg/eclipse/jgit/gitrepo/internal/RepoText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/gitrepo/internal/RepoText;->errorParsingManifestFile:Ljava/lang/String;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v7, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->filename:Ljava/lang/String;

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 301
    .local v1, error:Ljava/io/IOException;
    invoke-virtual {v1, v0}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 302
    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 304
    .end local v0           #e:Lorg/xml/sax/SAXException;
    .end local v1           #error:Ljava/io/IOException;
    :catchall_0
    move-exception v4

    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    throw v4
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 6
    .parameter "uri"
    .parameter "localName"
    .parameter "qName"
    .parameter "attributes"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 314
    const-string v0, "project"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 315
    new-instance v0, Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;

    const-string v1, "name"

    invoke-interface {p4, v1}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "path"

    invoke-interface {p4, v2}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "revision"

    invoke-interface {p4, v3}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "groups"

    invoke-interface {p4, v4}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->currentProject:Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;

    .line 337
    :cond_0
    :goto_0
    return-void

    .line 320
    :cond_1
    const-string v0, "remote"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 321
    iget-object v0, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->remotes:Ljava/util/Map;

    const-string v1, "name"

    invoke-interface {p4, v1}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "fetch"

    invoke-interface {p4, v2}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 323
    :cond_2
    const-string v0, "default"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 324
    const-string v0, "remote"

    invoke-interface {p4, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->defaultRemote:Ljava/lang/String;

    .line 325
    const-string v0, "revision"

    invoke-interface {p4, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->defaultRevision:Ljava/lang/String;

    .line 326
    iget-object v0, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->defaultRevision:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 327
    iget-object v0, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->command:Lorg/eclipse/jgit/gitrepo/RepoCommand;

    #getter for: Lorg/eclipse/jgit/gitrepo/RepoCommand;->branch:Ljava/lang/String;
    invoke-static {v0}, Lorg/eclipse/jgit/gitrepo/RepoCommand;->access$000(Lorg/eclipse/jgit/gitrepo/RepoCommand;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->defaultRevision:Ljava/lang/String;

    goto :goto_0

    .line 328
    :cond_3
    const-string v0, "copyfile"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 329
    iget-object v0, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->currentProject:Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;

    if-nez v0, :cond_4

    .line 330
    new-instance v0, Lorg/xml/sax/SAXException;

    invoke-static {}, Lorg/eclipse/jgit/gitrepo/internal/RepoText;->get()Lorg/eclipse/jgit/gitrepo/internal/RepoText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/gitrepo/internal/RepoText;->invalidManifest:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/xml/sax/SAXException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 331
    :cond_4
    iget-object v0, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->currentProject:Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;

    new-instance v1, Lorg/eclipse/jgit/gitrepo/RepoCommand$CopyFile;

    iget-object v2, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->command:Lorg/eclipse/jgit/gitrepo/RepoCommand;

    #getter for: Lorg/eclipse/jgit/gitrepo/RepoCommand;->repo:Lorg/eclipse/jgit/lib/Repository;
    invoke-static {v2}, Lorg/eclipse/jgit/gitrepo/RepoCommand;->access$100(Lorg/eclipse/jgit/gitrepo/RepoCommand;)Lorg/eclipse/jgit/lib/Repository;

    move-result-object v2

    iget-object v3, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->currentProject:Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;

    iget-object v3, v3, Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;->path:Ljava/lang/String;

    const-string v4, "src"

    invoke-interface {p4, v4}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "dest"

    invoke-interface {p4, v5}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v2, v3, v4, v5}, Lorg/eclipse/jgit/gitrepo/RepoCommand$CopyFile;-><init>(Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;->addCopyFile(Lorg/eclipse/jgit/gitrepo/RepoCommand$CopyFile;)V

    goto :goto_0
.end method
