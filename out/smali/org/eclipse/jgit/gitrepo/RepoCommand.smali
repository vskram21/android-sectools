.class public Lorg/eclipse/jgit/gitrepo/RepoCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "RepoCommand.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/gitrepo/RepoCommand$1;,
        Lorg/eclipse/jgit/gitrepo/RepoCommand$CopyFile;,
        Lorg/eclipse/jgit/gitrepo/RepoCommand$DefaultRemoteReader;,
        Lorg/eclipse/jgit/gitrepo/RepoCommand$ManifestErrorException;,
        Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;,
        Lorg/eclipse/jgit/gitrepo/RepoCommand$RemoteReader;,
        Lorg/eclipse/jgit/gitrepo/RepoCommand$RemoteUnavailableException;,
        Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/GitCommand",
        "<",
        "Lorg/eclipse/jgit/revwalk/RevCommit;",
        ">;"
    }
.end annotation


# instance fields
.field private author:Lorg/eclipse/jgit/lib/PersonIdent;

.field private bareProjects:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;",
            ">;"
        }
    .end annotation
.end field

.field private branch:Ljava/lang/String;

.field private callback:Lorg/eclipse/jgit/gitrepo/RepoCommand$RemoteReader;

.field private git:Lorg/eclipse/jgit/api/Git;

.field private groups:Ljava/lang/String;

.field private monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

.field private path:Ljava/lang/String;

.field private uri:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 0
    .parameter "repo"

    .prologue
    .line 409
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 410
    return-void
.end method

.method static synthetic access$000(Lorg/eclipse/jgit/gitrepo/RepoCommand;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 107
    iget-object v0, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->branch:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lorg/eclipse/jgit/gitrepo/RepoCommand;)Lorg/eclipse/jgit/lib/Repository;
    .locals 1
    .parameter "x0"

    .prologue
    .line 107
    iget-object v0, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    return-object v0
.end method

.method static synthetic access$200(Lorg/eclipse/jgit/gitrepo/RepoCommand;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 107
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/eclipse/jgit/gitrepo/RepoCommand;->addSubmodule(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method

.method private addSubmodule(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .locals 9
    .parameter "url"
    .parameter "name"
    .parameter "revision"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/gitrepo/RepoCommand$CopyFile;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 625
    .local p4, copyfiles:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/gitrepo/RepoCommand$CopyFile;>;"
    iget-object v7, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v7}, Lorg/eclipse/jgit/lib/Repository;->isBare()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 626
    new-instance v4, Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;

    const/4 v7, 0x0

    invoke-direct {v4, p1, p2, p3, v7}, Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 627
    .local v4, proj:Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;
    iget-object v7, v4, Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;->copyfiles:Ljava/util/List;

    invoke-interface {v7, p4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 628
    iget-object v7, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->bareProjects:Ljava/util/List;

    invoke-interface {v7, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 654
    .end local v4           #proj:Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;
    :cond_0
    return-void

    .line 630
    :cond_1
    iget-object v7, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->git:Lorg/eclipse/jgit/api/Git;

    invoke-virtual {v7}, Lorg/eclipse/jgit/api/Git;->submoduleAdd()Lorg/eclipse/jgit/api/SubmoduleAddCommand;

    move-result-object v7

    invoke-virtual {v7, p2}, Lorg/eclipse/jgit/api/SubmoduleAddCommand;->setPath(Ljava/lang/String;)Lorg/eclipse/jgit/api/SubmoduleAddCommand;

    move-result-object v7

    invoke-virtual {v7, p1}, Lorg/eclipse/jgit/api/SubmoduleAddCommand;->setURI(Ljava/lang/String;)Lorg/eclipse/jgit/api/SubmoduleAddCommand;

    move-result-object v0

    .line 634
    .local v0, add:Lorg/eclipse/jgit/api/SubmoduleAddCommand;
    iget-object v7, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    if-eqz v7, :cond_2

    .line 635
    iget-object v7, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-virtual {v0, v7}, Lorg/eclipse/jgit/api/SubmoduleAddCommand;->setProgressMonitor(Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/api/SubmoduleAddCommand;

    .line 638
    :cond_2
    :try_start_0
    invoke-virtual {v0}, Lorg/eclipse/jgit/api/SubmoduleAddCommand;->call()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v6

    .line 639
    .local v6, subRepo:Lorg/eclipse/jgit/lib/Repository;
    if-eqz p3, :cond_3

    .line 640
    new-instance v5, Lorg/eclipse/jgit/api/Git;

    invoke-direct {v5, v6}, Lorg/eclipse/jgit/api/Git;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 641
    .local v5, sub:Lorg/eclipse/jgit/api/Git;
    invoke-virtual {v5}, Lorg/eclipse/jgit/api/Git;->checkout()Lorg/eclipse/jgit/api/CheckoutCommand;

    move-result-object v7

    invoke-static {p3, v6}, Lorg/eclipse/jgit/gitrepo/RepoCommand;->findRef(Ljava/lang/String;Lorg/eclipse/jgit/lib/Repository;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/eclipse/jgit/api/CheckoutCommand;->setName(Ljava/lang/String;)Lorg/eclipse/jgit/api/CheckoutCommand;

    move-result-object v7

    invoke-virtual {v7}, Lorg/eclipse/jgit/api/CheckoutCommand;->call()Lorg/eclipse/jgit/lib/Ref;

    .line 642
    iget-object v7, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->git:Lorg/eclipse/jgit/api/Git;

    invoke-virtual {v7}, Lorg/eclipse/jgit/api/Git;->add()Lorg/eclipse/jgit/api/AddCommand;

    move-result-object v7

    invoke-virtual {v7, p2}, Lorg/eclipse/jgit/api/AddCommand;->addFilepattern(Ljava/lang/String;)Lorg/eclipse/jgit/api/AddCommand;

    move-result-object v7

    invoke-virtual {v7}, Lorg/eclipse/jgit/api/AddCommand;->call()Lorg/eclipse/jgit/dircache/DirCache;

    .line 644
    .end local v5           #sub:Lorg/eclipse/jgit/api/Git;
    :cond_3
    invoke-interface {p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/gitrepo/RepoCommand$CopyFile;

    .line 645
    .local v1, copyfile:Lorg/eclipse/jgit/gitrepo/RepoCommand$CopyFile;
    invoke-virtual {v1}, Lorg/eclipse/jgit/gitrepo/RepoCommand$CopyFile;->copy()V

    .line 646
    iget-object v7, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->git:Lorg/eclipse/jgit/api/Git;

    invoke-virtual {v7}, Lorg/eclipse/jgit/api/Git;->add()Lorg/eclipse/jgit/api/AddCommand;

    move-result-object v7

    iget-object v8, v1, Lorg/eclipse/jgit/gitrepo/RepoCommand$CopyFile;->dest:Ljava/lang/String;

    invoke-virtual {v7, v8}, Lorg/eclipse/jgit/api/AddCommand;->addFilepattern(Ljava/lang/String;)Lorg/eclipse/jgit/api/AddCommand;

    move-result-object v7

    invoke-virtual {v7}, Lorg/eclipse/jgit/api/AddCommand;->call()Lorg/eclipse/jgit/dircache/DirCache;
    :try_end_0
    .catch Lorg/eclipse/jgit/api/errors/GitAPIException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 648
    .end local v1           #copyfile:Lorg/eclipse/jgit/gitrepo/RepoCommand$CopyFile;
    .end local v3           #i$:Ljava/util/Iterator;
    .end local v6           #subRepo:Lorg/eclipse/jgit/lib/Repository;
    :catch_0
    move-exception v2

    .line 649
    .local v2, e:Lorg/eclipse/jgit/api/errors/GitAPIException;
    new-instance v7, Lorg/xml/sax/SAXException;

    invoke-direct {v7, v2}, Lorg/xml/sax/SAXException;-><init>(Ljava/lang/Exception;)V

    throw v7

    .line 650
    .end local v2           #e:Lorg/eclipse/jgit/api/errors/GitAPIException;
    :catch_1
    move-exception v2

    .line 651
    .local v2, e:Ljava/io/IOException;
    new-instance v7, Lorg/xml/sax/SAXException;

    invoke-direct {v7, v2}, Lorg/xml/sax/SAXException;-><init>(Ljava/lang/Exception;)V

    throw v7
.end method

.method private static findRef(Ljava/lang/String;Lorg/eclipse/jgit/lib/Repository;)Ljava/lang/String;
    .locals 3
    .parameter "ref"
    .parameter "repo"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 658
    invoke-static {p0}, Lorg/eclipse/jgit/lib/ObjectId;->isId(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 659
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "origin/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    .line 661
    .local v0, r:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v0, :cond_0

    .line 662
    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object p0

    .line 664
    .end local v0           #r:Lorg/eclipse/jgit/lib/Ref;
    .end local p0
    :cond_0
    return-object p0
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 107
    invoke-virtual {p0}, Lorg/eclipse/jgit/gitrepo/RepoCommand;->call()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    return-object v0
.end method

.method public call()Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 33
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 502
    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/gitrepo/RepoCommand;->checkCallable()V

    .line 503
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->path:Ljava/lang/String;

    move-object/from16 v28, v0

    if-eqz v28, :cond_0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->path:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Ljava/lang/String;->length()I

    move-result v28

    if-nez v28, :cond_1

    .line 504
    :cond_0
    new-instance v28, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v29

    move-object/from16 v0, v29

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->pathNotConfigured:Ljava/lang/String;

    move-object/from16 v29, v0

    invoke-direct/range {v28 .. v29}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v28

    .line 505
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->uri:Ljava/lang/String;

    move-object/from16 v28, v0

    if-eqz v28, :cond_2

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->uri:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Ljava/lang/String;->length()I

    move-result v28

    if-nez v28, :cond_3

    .line 506
    :cond_2
    new-instance v28, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v29

    move-object/from16 v0, v29

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->uriNotConfigured:Ljava/lang/String;

    move-object/from16 v29, v0

    invoke-direct/range {v28 .. v29}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v28

    .line 508
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lorg/eclipse/jgit/lib/Repository;->isBare()Z

    move-result v28

    if-eqz v28, :cond_7

    .line 509
    new-instance v28, Ljava/util/ArrayList;

    invoke-direct/range {v28 .. v28}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/gitrepo/RepoCommand;->bareProjects:Ljava/util/List;

    .line 510
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->author:Lorg/eclipse/jgit/lib/PersonIdent;

    move-object/from16 v28, v0

    if-nez v28, :cond_4

    .line 511
    new-instance v28, Lorg/eclipse/jgit/lib/PersonIdent;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v29, v0

    invoke-direct/range {v28 .. v29}, Lorg/eclipse/jgit/lib/PersonIdent;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/gitrepo/RepoCommand;->author:Lorg/eclipse/jgit/lib/PersonIdent;

    .line 512
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->callback:Lorg/eclipse/jgit/gitrepo/RepoCommand$RemoteReader;

    move-object/from16 v28, v0

    if-nez v28, :cond_5

    .line 513
    new-instance v28, Lorg/eclipse/jgit/gitrepo/RepoCommand$DefaultRemoteReader;

    invoke-direct/range {v28 .. v28}, Lorg/eclipse/jgit/gitrepo/RepoCommand$DefaultRemoteReader;-><init>()V

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/gitrepo/RepoCommand;->callback:Lorg/eclipse/jgit/gitrepo/RepoCommand$RemoteReader;

    .line 517
    :cond_5
    :goto_0
    new-instance v18, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->path:Ljava/lang/String;

    move-object/from16 v28, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->uri:Ljava/lang/String;

    move-object/from16 v29, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->groups:Ljava/lang/String;

    move-object/from16 v30, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    move-object/from16 v2, v28

    move-object/from16 v3, v29

    move-object/from16 v4, v30

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;-><init>(Lorg/eclipse/jgit/gitrepo/RepoCommand;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 519
    .local v18, manifest:Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;
    :try_start_0
    invoke-virtual/range {v18 .. v18}, Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;->read()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 524
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lorg/eclipse/jgit/lib/Repository;->isBare()Z

    move-result v28

    if-eqz v28, :cond_d

    .line 525
    invoke-static {}, Lorg/eclipse/jgit/dircache/DirCache;->newInCore()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v16

    .line 526
    .local v16, index:Lorg/eclipse/jgit/dircache/DirCache;
    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/dircache/DirCache;->builder()Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    move-result-object v5

    .line 527
    .local v5, builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lorg/eclipse/jgit/lib/Repository;->newObjectInserter()Lorg/eclipse/jgit/lib/ObjectInserter;

    move-result-object v17

    .line 528
    .local v17, inserter:Lorg/eclipse/jgit/lib/ObjectInserter;
    new-instance v24, Lorg/eclipse/jgit/revwalk/RevWalk;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v28, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v28

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 531
    .local v24, rw:Lorg/eclipse/jgit/revwalk/RevWalk;
    :try_start_1
    new-instance v6, Lorg/eclipse/jgit/lib/Config;

    invoke-direct {v6}, Lorg/eclipse/jgit/lib/Config;-><init>()V

    .line 532
    .local v6, cfg:Lorg/eclipse/jgit/lib/Config;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->bareProjects:Ljava/util/List;

    move-object/from16 v28, v0

    invoke-interface/range {v28 .. v28}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :cond_6
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v28

    if-eqz v28, :cond_a

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;

    .line 533
    .local v21, proj:Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;
    move-object/from16 v0, v21

    iget-object v0, v0, Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;->path:Ljava/lang/String;

    move-object/from16 v19, v0

    .line 534
    .local v19, name:Ljava/lang/String;
    move-object/from16 v0, v21

    iget-object v0, v0, Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;->name:Ljava/lang/String;

    move-object/from16 v27, v0

    .line 535
    .local v27, uri:Ljava/lang/String;
    const-string v28, "submodule"

    const-string v29, "path"

    move-object/from16 v0, v28

    move-object/from16 v1, v19

    move-object/from16 v2, v29

    move-object/from16 v3, v19

    invoke-virtual {v6, v0, v1, v2, v3}, Lorg/eclipse/jgit/lib/Config;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 536
    const-string v28, "submodule"

    const-string v29, "url"

    move-object/from16 v0, v28

    move-object/from16 v1, v19

    move-object/from16 v2, v29

    move-object/from16 v3, v27

    invoke-virtual {v6, v0, v1, v2, v3}, Lorg/eclipse/jgit/lib/Config;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 538
    new-instance v11, Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-object/from16 v0, v19

    invoke-direct {v11, v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;-><init>(Ljava/lang/String;)V

    .line 540
    .local v11, dcEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    move-object/from16 v0, v21

    iget-object v0, v0, Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;->revision:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-static/range {v28 .. v28}, Lorg/eclipse/jgit/lib/ObjectId;->isId(Ljava/lang/String;)Z

    move-result v28

    if-eqz v28, :cond_8

    .line 541
    move-object/from16 v0, v21

    iget-object v0, v0, Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;->revision:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-static/range {v28 .. v28}, Lorg/eclipse/jgit/lib/ObjectId;->fromString(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v20

    .line 545
    .local v20, objectId:Lorg/eclipse/jgit/lib/ObjectId;
    :goto_1
    if-nez v20, :cond_9

    .line 546
    new-instance v28, Lorg/eclipse/jgit/gitrepo/RepoCommand$RemoteUnavailableException;

    move-object/from16 v0, v28

    move-object/from16 v1, v27

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/gitrepo/RepoCommand$RemoteUnavailableException;-><init>(Ljava/lang/String;)V

    throw v28
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 610
    .end local v6           #cfg:Lorg/eclipse/jgit/lib/Config;
    .end local v11           #dcEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    .end local v19           #name:Ljava/lang/String;
    .end local v20           #objectId:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v21           #proj:Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;
    .end local v27           #uri:Ljava/lang/String;
    :catch_0
    move-exception v12

    .line 611
    .local v12, e:Ljava/io/IOException;
    :try_start_2
    new-instance v28, Lorg/eclipse/jgit/gitrepo/RepoCommand$ManifestErrorException;

    move-object/from16 v0, v28

    invoke-direct {v0, v12}, Lorg/eclipse/jgit/gitrepo/RepoCommand$ManifestErrorException;-><init>(Ljava/lang/Throwable;)V

    throw v28
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 613
    .end local v12           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v28

    invoke-virtual/range {v24 .. v24}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    throw v28

    .line 515
    .end local v5           #builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;
    .end local v16           #index:Lorg/eclipse/jgit/dircache/DirCache;
    .end local v17           #inserter:Lorg/eclipse/jgit/lib/ObjectInserter;
    .end local v18           #manifest:Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;
    .end local v24           #rw:Lorg/eclipse/jgit/revwalk/RevWalk;
    :cond_7
    new-instance v28, Lorg/eclipse/jgit/api/Git;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v29, v0

    invoke-direct/range {v28 .. v29}, Lorg/eclipse/jgit/api/Git;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/gitrepo/RepoCommand;->git:Lorg/eclipse/jgit/api/Git;

    goto/16 :goto_0

    .line 520
    .restart local v18       #manifest:Lorg/eclipse/jgit/gitrepo/RepoCommand$XmlManifest;
    :catch_1
    move-exception v12

    .line 521
    .restart local v12       #e:Ljava/io/IOException;
    new-instance v28, Lorg/eclipse/jgit/gitrepo/RepoCommand$ManifestErrorException;

    move-object/from16 v0, v28

    invoke-direct {v0, v12}, Lorg/eclipse/jgit/gitrepo/RepoCommand$ManifestErrorException;-><init>(Ljava/lang/Throwable;)V

    throw v28

    .line 543
    .end local v12           #e:Ljava/io/IOException;
    .restart local v5       #builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;
    .restart local v6       #cfg:Lorg/eclipse/jgit/lib/Config;
    .restart local v11       #dcEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    .restart local v16       #index:Lorg/eclipse/jgit/dircache/DirCache;
    .restart local v17       #inserter:Lorg/eclipse/jgit/lib/ObjectInserter;
    .restart local v19       #name:Ljava/lang/String;
    .restart local v21       #proj:Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;
    .restart local v24       #rw:Lorg/eclipse/jgit/revwalk/RevWalk;
    .restart local v27       #uri:Ljava/lang/String;
    :cond_8
    :try_start_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->callback:Lorg/eclipse/jgit/gitrepo/RepoCommand$RemoteReader;

    move-object/from16 v28, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;->revision:Ljava/lang/String;

    move-object/from16 v29, v0

    move-object/from16 v0, v28

    move-object/from16 v1, v27

    move-object/from16 v2, v29

    invoke-interface {v0, v1, v2}, Lorg/eclipse/jgit/gitrepo/RepoCommand$RemoteReader;->sha1(Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v20

    .restart local v20       #objectId:Lorg/eclipse/jgit/lib/ObjectId;
    goto :goto_1

    .line 547
    :cond_9
    move-object/from16 v0, v20

    invoke-virtual {v11, v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 548
    sget-object v28, Lorg/eclipse/jgit/lib/FileMode;->GITLINK:Lorg/eclipse/jgit/lib/FileMode;

    move-object/from16 v0, v28

    invoke-virtual {v11, v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setFileMode(Lorg/eclipse/jgit/lib/FileMode;)V

    .line 549
    invoke-virtual {v5, v11}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->add(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    .line 551
    move-object/from16 v0, v21

    iget-object v0, v0, Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;->copyfiles:Ljava/util/List;

    move-object/from16 v28, v0

    invoke-interface/range {v28 .. v28}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v15

    .local v15, i$:Ljava/util/Iterator;
    :goto_2
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v28

    if-eqz v28, :cond_6

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/eclipse/jgit/gitrepo/RepoCommand$CopyFile;

    .line 552
    .local v10, copyfile:Lorg/eclipse/jgit/gitrepo/RepoCommand$CopyFile;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->callback:Lorg/eclipse/jgit/gitrepo/RepoCommand$RemoteReader;

    move-object/from16 v28, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;->revision:Ljava/lang/String;

    move-object/from16 v29, v0

    iget-object v0, v10, Lorg/eclipse/jgit/gitrepo/RepoCommand$CopyFile;->src:Ljava/lang/String;

    move-object/from16 v30, v0

    move-object/from16 v0, v28

    move-object/from16 v1, v27

    move-object/from16 v2, v29

    move-object/from16 v3, v30

    invoke-interface {v0, v1, v2, v3}, Lorg/eclipse/jgit/gitrepo/RepoCommand$RemoteReader;->readFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v25

    .line 554
    .local v25, src:[B
    const/16 v28, 0x3

    move-object/from16 v0, v17

    move/from16 v1, v28

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/lib/ObjectInserter;->insert(I[B)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v20

    .line 555
    new-instance v11, Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .end local v11           #dcEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    iget-object v0, v10, Lorg/eclipse/jgit/gitrepo/RepoCommand$CopyFile;->dest:Ljava/lang/String;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    invoke-direct {v11, v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;-><init>(Ljava/lang/String;)V

    .line 556
    .restart local v11       #dcEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    move-object/from16 v0, v20

    invoke-virtual {v11, v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 557
    sget-object v28, Lorg/eclipse/jgit/lib/FileMode;->REGULAR_FILE:Lorg/eclipse/jgit/lib/FileMode;

    move-object/from16 v0, v28

    invoke-virtual {v11, v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setFileMode(Lorg/eclipse/jgit/lib/FileMode;)V

    .line 558
    invoke-virtual {v5, v11}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->add(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    goto :goto_2

    .line 561
    .end local v10           #copyfile:Lorg/eclipse/jgit/gitrepo/RepoCommand$CopyFile;
    .end local v11           #dcEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    .end local v15           #i$:Ljava/util/Iterator;
    .end local v19           #name:Ljava/lang/String;
    .end local v20           #objectId:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v21           #proj:Lorg/eclipse/jgit/gitrepo/RepoCommand$Project;
    .end local v25           #src:[B
    .end local v27           #uri:Ljava/lang/String;
    :cond_a
    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/Config;->toText()Ljava/lang/String;

    move-result-object v9

    .line 564
    .local v9, content:Ljava/lang/String;
    new-instance v11, Lorg/eclipse/jgit/dircache/DirCacheEntry;

    const-string v28, ".gitmodules"

    move-object/from16 v0, v28

    invoke-direct {v11, v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;-><init>(Ljava/lang/String;)V

    .line 565
    .restart local v11       #dcEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    const/16 v28, 0x3

    const-string v29, "UTF-8"

    move-object/from16 v0, v29

    invoke-virtual {v9, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v29

    move-object/from16 v0, v17

    move/from16 v1, v28

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/lib/ObjectInserter;->insert(I[B)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v20

    .line 567
    .restart local v20       #objectId:Lorg/eclipse/jgit/lib/ObjectId;
    move-object/from16 v0, v20

    invoke-virtual {v11, v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 568
    sget-object v28, Lorg/eclipse/jgit/lib/FileMode;->REGULAR_FILE:Lorg/eclipse/jgit/lib/FileMode;

    move-object/from16 v0, v28

    invoke-virtual {v11, v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setFileMode(Lorg/eclipse/jgit/lib/FileMode;)V

    .line 569
    invoke-virtual {v5, v11}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->add(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    .line 571
    invoke-virtual {v5}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->finish()V

    .line 572
    invoke-virtual/range {v16 .. v17}, Lorg/eclipse/jgit/dircache/DirCache;->writeTree(Lorg/eclipse/jgit/lib/ObjectInserter;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v26

    .line 575
    .local v26, treeId:Lorg/eclipse/jgit/lib/ObjectId;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v28, v0

    const-string v29, "HEAD^{commit}"

    invoke-virtual/range {v28 .. v29}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v13

    .line 576
    .local v13, headId:Lorg/eclipse/jgit/lib/ObjectId;
    new-instance v7, Lorg/eclipse/jgit/lib/CommitBuilder;

    invoke-direct {v7}, Lorg/eclipse/jgit/lib/CommitBuilder;-><init>()V

    .line 577
    .local v7, commit:Lorg/eclipse/jgit/lib/CommitBuilder;
    move-object/from16 v0, v26

    invoke-virtual {v7, v0}, Lorg/eclipse/jgit/lib/CommitBuilder;->setTreeId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 578
    if-eqz v13, :cond_b

    .line 579
    const/16 v28, 0x1

    move/from16 v0, v28

    new-array v0, v0, [Lorg/eclipse/jgit/lib/ObjectId;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    aput-object v13, v28, v29

    move-object/from16 v0, v28

    invoke-virtual {v7, v0}, Lorg/eclipse/jgit/lib/CommitBuilder;->setParentIds([Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 580
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->author:Lorg/eclipse/jgit/lib/PersonIdent;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    invoke-virtual {v7, v0}, Lorg/eclipse/jgit/lib/CommitBuilder;->setAuthor(Lorg/eclipse/jgit/lib/PersonIdent;)V

    .line 581
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->author:Lorg/eclipse/jgit/lib/PersonIdent;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    invoke-virtual {v7, v0}, Lorg/eclipse/jgit/lib/CommitBuilder;->setCommitter(Lorg/eclipse/jgit/lib/PersonIdent;)V

    .line 582
    invoke-static {}, Lorg/eclipse/jgit/gitrepo/internal/RepoText;->get()Lorg/eclipse/jgit/gitrepo/internal/RepoText;

    move-result-object v28

    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/eclipse/jgit/gitrepo/internal/RepoText;->repoCommitMessage:Ljava/lang/String;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    invoke-virtual {v7, v0}, Lorg/eclipse/jgit/lib/CommitBuilder;->setMessage(Ljava/lang/String;)V

    .line 584
    move-object/from16 v0, v17

    invoke-virtual {v0, v7}, Lorg/eclipse/jgit/lib/ObjectInserter;->insert(Lorg/eclipse/jgit/lib/CommitBuilder;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v8

    .line 585
    .local v8, commitId:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-virtual/range {v17 .. v17}, Lorg/eclipse/jgit/lib/ObjectInserter;->flush()V

    .line 587
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v28, v0

    const-string v29, "HEAD"

    invoke-virtual/range {v28 .. v29}, Lorg/eclipse/jgit/lib/Repository;->updateRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v23

    .line 588
    .local v23, ru:Lorg/eclipse/jgit/lib/RefUpdate;
    move-object/from16 v0, v23

    invoke-virtual {v0, v8}, Lorg/eclipse/jgit/lib/RefUpdate;->setNewObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 589
    if-eqz v13, :cond_c

    .end local v13           #headId:Lorg/eclipse/jgit/lib/ObjectId;
    :goto_3
    move-object/from16 v0, v23

    invoke-virtual {v0, v13}, Lorg/eclipse/jgit/lib/RefUpdate;->setExpectedOldObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 590
    invoke-virtual/range {v23 .. v24}, Lorg/eclipse/jgit/lib/RefUpdate;->update(Lorg/eclipse/jgit/revwalk/RevWalk;)Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v22

    .line 592
    .local v22, rc:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    sget-object v28, Lorg/eclipse/jgit/gitrepo/RepoCommand$1;->$SwitchMap$org$eclipse$jgit$lib$RefUpdate$Result:[I

    invoke-virtual/range {v22 .. v22}, Lorg/eclipse/jgit/lib/RefUpdate$Result;->ordinal()I

    move-result v29

    aget v28, v28, v29

    packed-switch v28, :pswitch_data_0

    .line 604
    new-instance v28, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v29

    move-object/from16 v0, v29

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->updatingRefFailed:Ljava/lang/String;

    move-object/from16 v29, v0

    const/16 v30, 0x3

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    const-string v32, "HEAD"

    aput-object v32, v30, v31

    const/16 v31, 0x1

    invoke-virtual {v8}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v32

    aput-object v32, v30, v31

    const/16 v31, 0x2

    aput-object v22, v30, v31

    invoke-static/range {v29 .. v30}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v29

    invoke-direct/range {v28 .. v29}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v28

    .line 589
    .end local v22           #rc:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .restart local v13       #headId:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_c
    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v13

    goto :goto_3

    .line 600
    .end local v13           #headId:Lorg/eclipse/jgit/lib/ObjectId;
    .restart local v22       #rc:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :pswitch_0
    new-instance v28, Lorg/eclipse/jgit/api/errors/ConcurrentRefUpdateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v29

    move-object/from16 v0, v29

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->couldNotLockHEAD:Ljava/lang/String;

    move-object/from16 v29, v0

    invoke-virtual/range {v23 .. v23}, Lorg/eclipse/jgit/lib/RefUpdate;->getRef()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v30

    move-object/from16 v0, v28

    move-object/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v22

    invoke-direct {v0, v1, v2, v3}, Lorg/eclipse/jgit/api/errors/ConcurrentRefUpdateException;-><init>(Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/RefUpdate$Result;)V

    throw v28

    .line 609
    :pswitch_1
    move-object/from16 v0, v24

    invoke-virtual {v0, v8}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    move-result-object v28

    .line 613
    invoke-virtual/range {v24 .. v24}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    .line 616
    .end local v5           #builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;
    .end local v6           #cfg:Lorg/eclipse/jgit/lib/Config;
    .end local v7           #commit:Lorg/eclipse/jgit/lib/CommitBuilder;
    .end local v8           #commitId:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v9           #content:Ljava/lang/String;
    .end local v11           #dcEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    .end local v16           #index:Lorg/eclipse/jgit/dircache/DirCache;
    .end local v17           #inserter:Lorg/eclipse/jgit/lib/ObjectInserter;
    .end local v20           #objectId:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v22           #rc:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .end local v23           #ru:Lorg/eclipse/jgit/lib/RefUpdate;
    .end local v24           #rw:Lorg/eclipse/jgit/revwalk/RevWalk;
    .end local v26           #treeId:Lorg/eclipse/jgit/lib/ObjectId;
    :goto_4
    return-object v28

    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->git:Lorg/eclipse/jgit/api/Git;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lorg/eclipse/jgit/api/Git;->commit()Lorg/eclipse/jgit/api/CommitCommand;

    move-result-object v28

    invoke-static {}, Lorg/eclipse/jgit/gitrepo/internal/RepoText;->get()Lorg/eclipse/jgit/gitrepo/internal/RepoText;

    move-result-object v29

    move-object/from16 v0, v29

    iget-object v0, v0, Lorg/eclipse/jgit/gitrepo/internal/RepoText;->repoCommitMessage:Ljava/lang/String;

    move-object/from16 v29, v0

    invoke-virtual/range {v28 .. v29}, Lorg/eclipse/jgit/api/CommitCommand;->setMessage(Ljava/lang/String;)Lorg/eclipse/jgit/api/CommitCommand;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Lorg/eclipse/jgit/api/CommitCommand;->call()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v28

    goto :goto_4

    .line 592
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public setAuthor(Lorg/eclipse/jgit/lib/PersonIdent;)Lorg/eclipse/jgit/gitrepo/RepoCommand;
    .locals 0
    .parameter "author"

    .prologue
    .line 483
    iput-object p1, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->author:Lorg/eclipse/jgit/lib/PersonIdent;

    .line 484
    return-object p0
.end method

.method public setBranch(Ljava/lang/String;)Lorg/eclipse/jgit/gitrepo/RepoCommand;
    .locals 0
    .parameter "branch"

    .prologue
    .line 457
    iput-object p1, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->branch:Ljava/lang/String;

    .line 458
    return-object p0
.end method

.method public setGroups(Ljava/lang/String;)Lorg/eclipse/jgit/gitrepo/RepoCommand;
    .locals 0
    .parameter "groups"

    .prologue
    .line 442
    iput-object p1, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->groups:Ljava/lang/String;

    .line 443
    return-object p0
.end method

.method public setPath(Ljava/lang/String;)Lorg/eclipse/jgit/gitrepo/RepoCommand;
    .locals 0
    .parameter "path"

    .prologue
    .line 420
    iput-object p1, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->path:Ljava/lang/String;

    .line 421
    return-object p0
.end method

.method public setProgressMonitor(Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/gitrepo/RepoCommand;
    .locals 0
    .parameter "monitor"

    .prologue
    .line 470
    iput-object p1, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->monitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    .line 471
    return-object p0
.end method

.method public setRemoteReader(Lorg/eclipse/jgit/gitrepo/RepoCommand$RemoteReader;)Lorg/eclipse/jgit/gitrepo/RepoCommand;
    .locals 0
    .parameter "callback"

    .prologue
    .line 496
    iput-object p1, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->callback:Lorg/eclipse/jgit/gitrepo/RepoCommand$RemoteReader;

    .line 497
    return-object p0
.end method

.method public setURI(Ljava/lang/String;)Lorg/eclipse/jgit/gitrepo/RepoCommand;
    .locals 0
    .parameter "uri"

    .prologue
    .line 431
    iput-object p1, p0, Lorg/eclipse/jgit/gitrepo/RepoCommand;->uri:Ljava/lang/String;

    .line 432
    return-object p0
.end method
