.class public abstract Lorg/eclipse/jgit/transport/Transport;
.super Ljava/lang/Object;
.source "Transport.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/transport/Transport$1;,
        Lorg/eclipse/jgit/transport/Transport$Operation;
    }
.end annotation


# static fields
.field public static final DEFAULT_FETCH_THIN:Z = true

.field public static final DEFAULT_PUSH_THIN:Z

.field public static final REFSPEC_PUSH_ALL:Lorg/eclipse/jgit/transport/RefSpec;

.field public static final REFSPEC_TAGS:Lorg/eclipse/jgit/transport/RefSpec;

.field private static final protocols:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lorg/eclipse/jgit/transport/TransportProtocol;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field private checkFetchedObjects:Z

.field private credentialsProvider:Lorg/eclipse/jgit/transport/CredentialsProvider;

.field private dryRun:Z

.field private fetch:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/RefSpec;",
            ">;"
        }
    .end annotation
.end field

.field private fetchThin:Z

.field protected final local:Lorg/eclipse/jgit/lib/Repository;

.field private optionReceivePack:Ljava/lang/String;

.field private optionUploadPack:Ljava/lang/String;

.field private packConfig:Lorg/eclipse/jgit/storage/pack/PackConfig;

.field private push:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/RefSpec;",
            ">;"
        }
    .end annotation
.end field

.field private pushThin:Z

.field private removeDeletedRefs:Z

.field private tagopt:Lorg/eclipse/jgit/transport/TagOpt;

.field private timeout:I

.field protected final uri:Lorg/eclipse/jgit/transport/URIish;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 105
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/transport/Transport;->protocols:Ljava/util/List;

    .line 110
    sget-object v0, Lorg/eclipse/jgit/transport/TransportLocal;->PROTO_LOCAL:Lorg/eclipse/jgit/transport/TransportProtocol;

    invoke-static {v0}, Lorg/eclipse/jgit/transport/Transport;->register(Lorg/eclipse/jgit/transport/TransportProtocol;)V

    .line 111
    sget-object v0, Lorg/eclipse/jgit/transport/TransportBundleFile;->PROTO_BUNDLE:Lorg/eclipse/jgit/transport/TransportProtocol;

    invoke-static {v0}, Lorg/eclipse/jgit/transport/Transport;->register(Lorg/eclipse/jgit/transport/TransportProtocol;)V

    .line 112
    sget-object v0, Lorg/eclipse/jgit/transport/TransportAmazonS3;->PROTO_S3:Lorg/eclipse/jgit/transport/TransportProtocol;

    invoke-static {v0}, Lorg/eclipse/jgit/transport/Transport;->register(Lorg/eclipse/jgit/transport/TransportProtocol;)V

    .line 113
    sget-object v0, Lorg/eclipse/jgit/transport/TransportGitAnon;->PROTO_GIT:Lorg/eclipse/jgit/transport/TransportProtocol;

    invoke-static {v0}, Lorg/eclipse/jgit/transport/Transport;->register(Lorg/eclipse/jgit/transport/TransportProtocol;)V

    .line 114
    sget-object v0, Lorg/eclipse/jgit/transport/TransportSftp;->PROTO_SFTP:Lorg/eclipse/jgit/transport/TransportProtocol;

    invoke-static {v0}, Lorg/eclipse/jgit/transport/Transport;->register(Lorg/eclipse/jgit/transport/TransportProtocol;)V

    .line 115
    sget-object v0, Lorg/eclipse/jgit/transport/TransportHttp;->PROTO_FTP:Lorg/eclipse/jgit/transport/TransportProtocol;

    invoke-static {v0}, Lorg/eclipse/jgit/transport/Transport;->register(Lorg/eclipse/jgit/transport/TransportProtocol;)V

    .line 116
    sget-object v0, Lorg/eclipse/jgit/transport/TransportHttp;->PROTO_HTTP:Lorg/eclipse/jgit/transport/TransportProtocol;

    invoke-static {v0}, Lorg/eclipse/jgit/transport/Transport;->register(Lorg/eclipse/jgit/transport/TransportProtocol;)V

    .line 117
    sget-object v0, Lorg/eclipse/jgit/transport/TransportGitSsh;->PROTO_SSH:Lorg/eclipse/jgit/transport/TransportProtocol;

    invoke-static {v0}, Lorg/eclipse/jgit/transport/Transport;->register(Lorg/eclipse/jgit/transport/TransportProtocol;)V

    .line 119
    invoke-static {}, Lorg/eclipse/jgit/transport/Transport;->registerByService()V

    .line 696
    new-instance v0, Lorg/eclipse/jgit/transport/RefSpec;

    const-string v1, "refs/tags/*:refs/tags/*"

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/transport/RefSpec;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/eclipse/jgit/transport/Transport;->REFSPEC_TAGS:Lorg/eclipse/jgit/transport/RefSpec;

    .line 703
    new-instance v0, Lorg/eclipse/jgit/transport/RefSpec;

    const-string v1, "refs/heads/*:refs/heads/*"

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/transport/RefSpec;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/eclipse/jgit/transport/Transport;->REFSPEC_PUSH_ALL:Lorg/eclipse/jgit/transport/RefSpec;

    return-void
.end method

.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;)V
    .locals 3
    .parameter "local"
    .parameter "uri"

    .prologue
    .line 770
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 713
    const-string v1, "git-upload-pack"

    iput-object v1, p0, Lorg/eclipse/jgit/transport/Transport;->optionUploadPack:Ljava/lang/String;

    .line 716
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/Transport;->fetch:Ljava/util/List;

    .line 727
    sget-object v1, Lorg/eclipse/jgit/transport/TagOpt;->NO_TAGS:Lorg/eclipse/jgit/transport/TagOpt;

    iput-object v1, p0, Lorg/eclipse/jgit/transport/Transport;->tagopt:Lorg/eclipse/jgit/transport/TagOpt;

    .line 730
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/eclipse/jgit/transport/Transport;->fetchThin:Z

    .line 733
    const-string v1, "git-receive-pack"

    iput-object v1, p0, Lorg/eclipse/jgit/transport/Transport;->optionReceivePack:Ljava/lang/String;

    .line 736
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/Transport;->push:Ljava/util/List;

    .line 739
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/eclipse/jgit/transport/Transport;->pushThin:Z

    .line 771
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v1

    sget-object v2, Lorg/eclipse/jgit/transport/TransferConfig;->KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/StoredConfig;->get(Lorg/eclipse/jgit/lib/Config$SectionParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/transport/TransferConfig;

    .line 772
    .local v0, tc:Lorg/eclipse/jgit/transport/TransferConfig;
    iput-object p1, p0, Lorg/eclipse/jgit/transport/Transport;->local:Lorg/eclipse/jgit/lib/Repository;

    .line 773
    iput-object p2, p0, Lorg/eclipse/jgit/transport/Transport;->uri:Lorg/eclipse/jgit/transport/URIish;

    .line 774
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/TransferConfig;->isFsckObjects()Z

    move-result v1

    iput-boolean v1, p0, Lorg/eclipse/jgit/transport/Transport;->checkFetchedObjects:Z

    .line 775
    invoke-static {}, Lorg/eclipse/jgit/transport/CredentialsProvider;->getDefault()Lorg/eclipse/jgit/transport/CredentialsProvider;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/Transport;->credentialsProvider:Lorg/eclipse/jgit/transport/CredentialsProvider;

    .line 776
    return-void
.end method

.method protected constructor <init>(Lorg/eclipse/jgit/transport/URIish;)V
    .locals 2
    .parameter "uri"

    .prologue
    const/4 v1, 0x1

    .line 783
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 713
    const-string v0, "git-upload-pack"

    iput-object v0, p0, Lorg/eclipse/jgit/transport/Transport;->optionUploadPack:Ljava/lang/String;

    .line 716
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/Transport;->fetch:Ljava/util/List;

    .line 727
    sget-object v0, Lorg/eclipse/jgit/transport/TagOpt;->NO_TAGS:Lorg/eclipse/jgit/transport/TagOpt;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/Transport;->tagopt:Lorg/eclipse/jgit/transport/TagOpt;

    .line 730
    iput-boolean v1, p0, Lorg/eclipse/jgit/transport/Transport;->fetchThin:Z

    .line 733
    const-string v0, "git-receive-pack"

    iput-object v0, p0, Lorg/eclipse/jgit/transport/Transport;->optionReceivePack:Ljava/lang/String;

    .line 736
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/Transport;->push:Ljava/util/List;

    .line 739
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/eclipse/jgit/transport/Transport;->pushThin:Z

    .line 784
    iput-object p1, p0, Lorg/eclipse/jgit/transport/Transport;->uri:Lorg/eclipse/jgit/transport/URIish;

    .line 785
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/Transport;->local:Lorg/eclipse/jgit/lib/Repository;

    .line 786
    iput-boolean v1, p0, Lorg/eclipse/jgit/transport/Transport;->checkFetchedObjects:Z

    .line 787
    invoke-static {}, Lorg/eclipse/jgit/transport/CredentialsProvider;->getDefault()Lorg/eclipse/jgit/transport/CredentialsProvider;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/Transport;->credentialsProvider:Lorg/eclipse/jgit/transport/CredentialsProvider;

    .line 788
    return-void
.end method

.method private static catalogs(Ljava/lang/ClassLoader;)Ljava/util/Enumeration;
    .locals 5
    .parameter "ldr"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ClassLoader;",
            ")",
            "Ljava/util/Enumeration",
            "<",
            "Ljava/net/URL;",
            ">;"
        }
    .end annotation

    .prologue
    .line 133
    :try_start_0
    const-string v2, "META-INF/services/"

    .line 134
    .local v2, prefix:Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-class v4, Lorg/eclipse/jgit/transport/Transport;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 135
    .local v1, name:Ljava/lang/String;
    invoke-virtual {p0, v1}, Ljava/lang/ClassLoader;->getResources(Ljava/lang/String;)Ljava/util/Enumeration;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 137
    .end local v1           #name:Ljava/lang/String;
    .end local v2           #prefix:Ljava/lang/String;
    :goto_0
    return-object v3

    .line 136
    :catch_0
    move-exception v0

    .line 137
    .local v0, err:Ljava/io/IOException;
    new-instance v3, Ljava/util/Vector;

    invoke-direct {v3}, Ljava/util/Vector;-><init>()V

    invoke-virtual {v3}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v3

    goto :goto_0
.end method

.method private static doesNotExist(Lorg/eclipse/jgit/transport/RemoteConfig;)Z
    .locals 1
    .parameter "cfg"

    .prologue
    .line 509
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RemoteConfig;->getURIs()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RemoteConfig;->getPushURIs()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static expandPushWildcardsFor(Lorg/eclipse/jgit/lib/Repository;Ljava/util/Collection;)Ljava/util/Collection;
    .locals 8
    .parameter "db"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/Repository;",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/transport/RefSpec;",
            ">;)",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/transport/RefSpec;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 651
    .local p1, specs:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/RefSpec;>;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;

    move-result-object v6

    const-string v7, ""

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/lib/RefDatabase;->getRefs(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v3

    .line 652
    .local v3, localRefs:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 654
    .local v4, procRefs:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/RefSpec;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/transport/RefSpec;

    .line 655
    .local v5, spec:Lorg/eclipse/jgit/transport/RefSpec;
    invoke-virtual {v5}, Lorg/eclipse/jgit/transport/RefSpec;->isWildcard()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 656
    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_1
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/lib/Ref;

    .line 657
    .local v2, localRef:Lorg/eclipse/jgit/lib/Ref;
    invoke-virtual {v5, v2}, Lorg/eclipse/jgit/transport/RefSpec;->matchSource(Lorg/eclipse/jgit/lib/Ref;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 658
    invoke-virtual {v5, v2}, Lorg/eclipse/jgit/transport/RefSpec;->expandFromSource(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/transport/RefSpec;

    move-result-object v6

    invoke-interface {v4, v6}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 661
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v2           #localRef:Lorg/eclipse/jgit/lib/Ref;
    :cond_2
    invoke-interface {v4, v5}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 664
    .end local v5           #spec:Lorg/eclipse/jgit/transport/RefSpec;
    :cond_3
    return-object v4
.end method

.method public static findRemoteRefUpdatesFor(Lorg/eclipse/jgit/lib/Repository;Ljava/util/Collection;Ljava/util/Collection;)Ljava/util/Collection;
    .locals 16
    .parameter "db"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/Repository;",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/transport/RefSpec;",
            ">;",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/transport/RefSpec;",
            ">;)",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/transport/RemoteRefUpdate;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 611
    .local p1, specs:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/RefSpec;>;"
    .local p2, fetchSpecs:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/RefSpec;>;"
    if-nez p2, :cond_0

    .line 612
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p2

    .line 613
    :cond_0
    new-instance v12, Ljava/util/LinkedList;

    invoke-direct {v12}, Ljava/util/LinkedList;-><init>()V

    .line 614
    .local v12, result:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/RemoteRefUpdate;>;"
    invoke-static/range {p0 .. p1}, Lorg/eclipse/jgit/transport/Transport;->expandPushWildcardsFor(Lorg/eclipse/jgit/lib/Repository;Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v11

    .line 616
    .local v11, procRefs:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/RefSpec;>;"
    invoke-interface {v11}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lorg/eclipse/jgit/transport/RefSpec;

    .line 617
    .local v13, spec:Lorg/eclipse/jgit/transport/RefSpec;
    invoke-virtual {v13}, Lorg/eclipse/jgit/transport/RefSpec;->getSource()Ljava/lang/String;

    move-result-object v3

    .line 618
    .local v3, srcSpec:Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v14

    .line 619
    .local v14, srcRef:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v14, :cond_1

    .line 620
    invoke-interface {v14}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v3

    .line 622
    :cond_1
    invoke-virtual {v13}, Lorg/eclipse/jgit/transport/RefSpec;->getDestination()Ljava/lang/String;

    move-result-object v4

    .line 623
    .local v4, destSpec:Ljava/lang/String;
    if-nez v4, :cond_2

    .line 626
    move-object v4, v3

    .line 629
    :cond_2
    if-eqz v14, :cond_3

    const-string v2, "refs/"

    invoke-virtual {v4, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 634
    invoke-interface {v14}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v10

    .line 635
    .local v10, n:Ljava/lang/String;
    const/16 v2, 0x2f

    const-string v7, "refs/"

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v10, v2, v7}, Ljava/lang/String;->indexOf(II)I

    move-result v9

    .line 636
    .local v9, kindEnd:I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v7, 0x0

    add-int/lit8 v15, v9, 0x1

    invoke-virtual {v10, v7, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 639
    .end local v9           #kindEnd:I
    .end local v10           #n:Ljava/lang/String;
    :cond_3
    invoke-virtual {v13}, Lorg/eclipse/jgit/transport/RefSpec;->isForceUpdate()Z

    move-result v5

    .line 640
    .local v5, forceUpdate:Z
    move-object/from16 v0, p2

    invoke-static {v4, v0}, Lorg/eclipse/jgit/transport/Transport;->findTrackingRefName(Ljava/lang/String;Ljava/util/Collection;)Ljava/lang/String;

    move-result-object v6

    .line 641
    .local v6, localName:Ljava/lang/String;
    new-instance v1, Lorg/eclipse/jgit/transport/RemoteRefUpdate;

    const/4 v7, 0x0

    move-object/from16 v2, p0

    invoke-direct/range {v1 .. v7}, Lorg/eclipse/jgit/transport/RemoteRefUpdate;-><init>(Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 643
    .local v1, rru:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    invoke-interface {v12, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 645
    .end local v1           #rru:Lorg/eclipse/jgit/transport/RemoteRefUpdate;
    .end local v3           #srcSpec:Ljava/lang/String;
    .end local v4           #destSpec:Ljava/lang/String;
    .end local v5           #forceUpdate:Z
    .end local v6           #localName:Ljava/lang/String;
    .end local v13           #spec:Lorg/eclipse/jgit/transport/RefSpec;
    .end local v14           #srcRef:Lorg/eclipse/jgit/lib/Ref;
    :cond_4
    return-object v12
.end method

.method private static findTrackingRefName(Ljava/lang/String;Ljava/util/Collection;)Ljava/lang/String;
    .locals 3
    .parameter "remoteName"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/transport/RefSpec;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 670
    .local p1, fetchSpecs:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/RefSpec;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/transport/RefSpec;

    .line 671
    .local v0, fetchSpec:Lorg/eclipse/jgit/transport/RefSpec;
    invoke-virtual {v0, p0}, Lorg/eclipse/jgit/transport/RefSpec;->matchSource(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 672
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/RefSpec;->isWildcard()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 673
    invoke-virtual {v0, p0}, Lorg/eclipse/jgit/transport/RefSpec;->expandFromSource(Ljava/lang/String;)Lorg/eclipse/jgit/transport/RefSpec;

    move-result-object v2

    invoke-virtual {v2}, Lorg/eclipse/jgit/transport/RefSpec;->getDestination()Ljava/lang/String;

    move-result-object v2

    .line 679
    .end local v0           #fetchSpec:Lorg/eclipse/jgit/transport/RefSpec;
    :goto_0
    return-object v2

    .line 676
    .restart local v0       #fetchSpec:Lorg/eclipse/jgit/transport/RefSpec;
    :cond_1
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/RefSpec;->getDestination()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 679
    .end local v0           #fetchSpec:Lorg/eclipse/jgit/transport/RefSpec;
    :cond_2
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static getTransportProtocols()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/TransportProtocol;",
            ">;"
        }
    .end annotation

    .prologue
    .line 252
    sget-object v5, Lorg/eclipse/jgit/transport/Transport;->protocols:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v0

    .line 253
    .local v0, cnt:I
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 254
    .local v4, res:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/TransportProtocol;>;"
    sget-object v5, Lorg/eclipse/jgit/transport/Transport;->protocols:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/ref/WeakReference;

    .line 255
    .local v3, ref:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lorg/eclipse/jgit/transport/TransportProtocol;>;"
    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/transport/TransportProtocol;

    .line 256
    .local v2, proto:Lorg/eclipse/jgit/transport/TransportProtocol;
    if-eqz v2, :cond_0

    .line 257
    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 259
    :cond_0
    sget-object v5, Lorg/eclipse/jgit/transport/Transport;->protocols:Ljava/util/List;

    invoke-interface {v5, v3}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    .line 261
    .end local v2           #proto:Lorg/eclipse/jgit/transport/TransportProtocol;
    .end local v3           #ref:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lorg/eclipse/jgit/transport/TransportProtocol;>;"
    :cond_1
    invoke-static {v4}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v5

    return-object v5
.end method

.method private static getURIs(Lorg/eclipse/jgit/transport/RemoteConfig;Lorg/eclipse/jgit/transport/Transport$Operation;)Ljava/util/List;
    .locals 3
    .parameter "cfg"
    .parameter "op"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/transport/RemoteConfig;",
            "Lorg/eclipse/jgit/transport/Transport$Operation;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/URIish;",
            ">;"
        }
    .end annotation

    .prologue
    .line 494
    sget-object v1, Lorg/eclipse/jgit/transport/Transport$1;->$SwitchMap$org$eclipse$jgit$transport$Transport$Operation:[I

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/Transport$Operation;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 504
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/Transport$Operation;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 496
    :pswitch_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RemoteConfig;->getURIs()Ljava/util/List;

    move-result-object v0

    .line 501
    :cond_0
    :goto_0
    return-object v0

    .line 498
    :pswitch_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RemoteConfig;->getPushURIs()Ljava/util/List;

    move-result-object v0

    .line 499
    .local v0, uris:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/URIish;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 500
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RemoteConfig;->getURIs()Ljava/util/List;

    move-result-object v0

    goto :goto_0

    .line 494
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private static load(Ljava/lang/ClassLoader;Ljava/lang/String;)V
    .locals 10
    .parameter "ldr"
    .parameter "cn"

    .prologue
    .line 180
    const/4 v8, 0x0

    :try_start_0
    invoke-static {p1, v8, p0}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 187
    .local v1, clazz:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-virtual {v1}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v0

    .local v0, arr$:[Ljava/lang/reflect/Field;
    array-length v5, v0

    .local v5, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_0
    if-ge v4, v5, :cond_1

    aget-object v3, v0, v4

    .line 188
    .local v3, f:Ljava/lang/reflect/Field;
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v8

    and-int/lit8 v8, v8, 0x8

    const/16 v9, 0x8

    if-ne v8, v9, :cond_0

    const-class v8, Lorg/eclipse/jgit/transport/TransportProtocol;

    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 192
    const/4 v8, 0x0

    :try_start_1
    invoke-virtual {v3, v8}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/eclipse/jgit/transport/TransportProtocol;
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_2

    .line 200
    .local v7, proto:Lorg/eclipse/jgit/transport/TransportProtocol;
    if-eqz v7, :cond_0

    .line 201
    invoke-static {v7}, Lorg/eclipse/jgit/transport/Transport;->register(Lorg/eclipse/jgit/transport/TransportProtocol;)V

    .line 187
    .end local v7           #proto:Lorg/eclipse/jgit/transport/TransportProtocol;
    :cond_0
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 181
    .end local v0           #arr$:[Ljava/lang/reflect/Field;
    .end local v1           #clazz:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    .end local v3           #f:Ljava/lang/reflect/Field;
    .end local v4           #i$:I
    .end local v5           #len$:I
    :catch_0
    move-exception v6

    .line 204
    :cond_1
    return-void

    .line 193
    .restart local v0       #arr$:[Ljava/lang/reflect/Field;
    .restart local v1       #clazz:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    .restart local v3       #f:Ljava/lang/reflect/Field;
    .restart local v4       #i$:I
    .restart local v5       #len$:I
    :catch_1
    move-exception v2

    .line 195
    .local v2, e:Ljava/lang/IllegalArgumentException;
    goto :goto_1

    .line 196
    .end local v2           #e:Ljava/lang/IllegalArgumentException;
    :catch_2
    move-exception v2

    .line 198
    .local v2, e:Ljava/lang/IllegalAccessException;
    goto :goto_1
.end method

.method public static open(Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;)Lorg/eclipse/jgit/transport/Transport;
    .locals 1
    .parameter "local"
    .parameter "remote"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;,
            Ljava/net/URISyntaxException;,
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 287
    sget-object v0, Lorg/eclipse/jgit/transport/Transport$Operation;->FETCH:Lorg/eclipse/jgit/transport/Transport$Operation;

    invoke-static {p0, p1, v0}, Lorg/eclipse/jgit/transport/Transport;->open(Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;Lorg/eclipse/jgit/transport/Transport$Operation;)Lorg/eclipse/jgit/transport/Transport;

    move-result-object v0

    return-object v0
.end method

.method public static open(Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;Lorg/eclipse/jgit/transport/Transport$Operation;)Lorg/eclipse/jgit/transport/Transport;
    .locals 3
    .parameter "local"
    .parameter "remote"
    .parameter "op"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;,
            Ljava/net/URISyntaxException;,
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 314
    new-instance v0, Lorg/eclipse/jgit/transport/RemoteConfig;

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lorg/eclipse/jgit/transport/RemoteConfig;-><init>(Lorg/eclipse/jgit/lib/Config;Ljava/lang/String;)V

    .line 315
    .local v0, cfg:Lorg/eclipse/jgit/transport/RemoteConfig;
    invoke-static {v0}, Lorg/eclipse/jgit/transport/Transport;->doesNotExist(Lorg/eclipse/jgit/transport/RemoteConfig;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 316
    new-instance v1, Lorg/eclipse/jgit/transport/URIish;

    invoke-direct {v1, p1}, Lorg/eclipse/jgit/transport/URIish;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Lorg/eclipse/jgit/transport/Transport;->open(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)Lorg/eclipse/jgit/transport/Transport;

    move-result-object v1

    .line 317
    :goto_0
    return-object v1

    :cond_0
    invoke-static {p0, v0, p2}, Lorg/eclipse/jgit/transport/Transport;->open(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/RemoteConfig;Lorg/eclipse/jgit/transport/Transport$Operation;)Lorg/eclipse/jgit/transport/Transport;

    move-result-object v1

    goto :goto_0
.end method

.method public static open(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/RemoteConfig;)Lorg/eclipse/jgit/transport/Transport;
    .locals 1
    .parameter "local"
    .parameter "cfg"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;,
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 402
    sget-object v0, Lorg/eclipse/jgit/transport/Transport$Operation;->FETCH:Lorg/eclipse/jgit/transport/Transport$Operation;

    invoke-static {p0, p1, v0}, Lorg/eclipse/jgit/transport/Transport;->open(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/RemoteConfig;Lorg/eclipse/jgit/transport/Transport$Operation;)Lorg/eclipse/jgit/transport/Transport;

    move-result-object v0

    return-object v0
.end method

.method public static open(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/RemoteConfig;Lorg/eclipse/jgit/transport/Transport$Operation;)Lorg/eclipse/jgit/transport/Transport;
    .locals 7
    .parameter "local"
    .parameter "cfg"
    .parameter "op"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;,
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 429
    invoke-static {p1, p2}, Lorg/eclipse/jgit/transport/Transport;->getURIs(Lorg/eclipse/jgit/transport/RemoteConfig;Lorg/eclipse/jgit/transport/Transport$Operation;)Ljava/util/List;

    move-result-object v1

    .line 430
    .local v1, uris:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/URIish;>;"
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 431
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->remoteConfigHasNoURIAssociated:Ljava/lang/String;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/RemoteConfig;->getName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 433
    :cond_0
    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/RemoteConfig;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v2, v3}, Lorg/eclipse/jgit/transport/Transport;->open(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)Lorg/eclipse/jgit/transport/Transport;

    move-result-object v0

    .line 434
    .local v0, tn:Lorg/eclipse/jgit/transport/Transport;
    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/transport/Transport;->applyConfig(Lorg/eclipse/jgit/transport/RemoteConfig;)V

    .line 435
    return-object v0
.end method

.method public static open(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;)Lorg/eclipse/jgit/transport/Transport;
    .locals 1
    .parameter "local"
    .parameter "uri"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;,
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 527
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/eclipse/jgit/transport/Transport;->open(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)Lorg/eclipse/jgit/transport/Transport;

    move-result-object v0

    return-object v0
.end method

.method public static open(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)Lorg/eclipse/jgit/transport/Transport;
    .locals 7
    .parameter "local"
    .parameter "uri"
    .parameter "remoteName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;,
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 548
    sget-object v3, Lorg/eclipse/jgit/transport/Transport;->protocols:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    .line 549
    .local v2, ref:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lorg/eclipse/jgit/transport/TransportProtocol;>;"
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/transport/TransportProtocol;

    .line 550
    .local v1, proto:Lorg/eclipse/jgit/transport/TransportProtocol;
    if-nez v1, :cond_1

    .line 551
    sget-object v3, Lorg/eclipse/jgit/transport/Transport;->protocols:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    .line 555
    :cond_1
    invoke-virtual {v1, p1, p0, p2}, Lorg/eclipse/jgit/transport/TransportProtocol;->canHandle(Lorg/eclipse/jgit/transport/URIish;Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 556
    invoke-virtual {v1, p1, p0, p2}, Lorg/eclipse/jgit/transport/TransportProtocol;->open(Lorg/eclipse/jgit/transport/URIish;Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;)Lorg/eclipse/jgit/transport/Transport;

    move-result-object v3

    return-object v3

    .line 559
    .end local v1           #proto:Lorg/eclipse/jgit/transport/TransportProtocol;
    .end local v2           #ref:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lorg/eclipse/jgit/transport/TransportProtocol;>;"
    :cond_2
    new-instance v3, Lorg/eclipse/jgit/errors/NotSupportedException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->URINotSupported:Ljava/lang/String;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/errors/NotSupportedException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public static open(Lorg/eclipse/jgit/transport/URIish;)Lorg/eclipse/jgit/transport/Transport;
    .locals 7
    .parameter "uri"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;,
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 574
    sget-object v3, Lorg/eclipse/jgit/transport/Transport;->protocols:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    .line 575
    .local v2, ref:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lorg/eclipse/jgit/transport/TransportProtocol;>;"
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/transport/TransportProtocol;

    .line 576
    .local v1, proto:Lorg/eclipse/jgit/transport/TransportProtocol;
    if-nez v1, :cond_1

    .line 577
    sget-object v3, Lorg/eclipse/jgit/transport/Transport;->protocols:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    .line 581
    :cond_1
    invoke-virtual {v1, p0, v4, v4}, Lorg/eclipse/jgit/transport/TransportProtocol;->canHandle(Lorg/eclipse/jgit/transport/URIish;Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 582
    invoke-virtual {v1, p0}, Lorg/eclipse/jgit/transport/TransportProtocol;->open(Lorg/eclipse/jgit/transport/URIish;)Lorg/eclipse/jgit/transport/Transport;

    move-result-object v3

    return-object v3

    .line 585
    .end local v1           #proto:Lorg/eclipse/jgit/transport/TransportProtocol;
    .end local v2           #ref:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lorg/eclipse/jgit/transport/TransportProtocol;>;"
    :cond_2
    new-instance v3, Lorg/eclipse/jgit/errors/NotSupportedException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->URINotSupported:Ljava/lang/String;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p0, v5, v6

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/errors/NotSupportedException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public static openAll(Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .parameter "local"
    .parameter "remote"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/Repository;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/Transport;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;,
            Ljava/net/URISyntaxException;,
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 343
    sget-object v0, Lorg/eclipse/jgit/transport/Transport$Operation;->FETCH:Lorg/eclipse/jgit/transport/Transport$Operation;

    invoke-static {p0, p1, v0}, Lorg/eclipse/jgit/transport/Transport;->openAll(Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;Lorg/eclipse/jgit/transport/Transport$Operation;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static openAll(Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;Lorg/eclipse/jgit/transport/Transport$Operation;)Ljava/util/List;
    .locals 4
    .parameter "local"
    .parameter "remote"
    .parameter "op"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/Repository;",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/transport/Transport$Operation;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/Transport;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;,
            Ljava/net/URISyntaxException;,
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 371
    new-instance v0, Lorg/eclipse/jgit/transport/RemoteConfig;

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v2

    invoke-direct {v0, v2, p1}, Lorg/eclipse/jgit/transport/RemoteConfig;-><init>(Lorg/eclipse/jgit/lib/Config;Ljava/lang/String;)V

    .line 372
    .local v0, cfg:Lorg/eclipse/jgit/transport/RemoteConfig;
    invoke-static {v0}, Lorg/eclipse/jgit/transport/Transport;->doesNotExist(Lorg/eclipse/jgit/transport/RemoteConfig;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 373
    new-instance v1, Ljava/util/ArrayList;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 374
    .local v1, transports:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/eclipse/jgit/transport/Transport;>;"
    new-instance v2, Lorg/eclipse/jgit/transport/URIish;

    invoke-direct {v2, p1}, Lorg/eclipse/jgit/transport/URIish;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x0

    invoke-static {p0, v2, v3}, Lorg/eclipse/jgit/transport/Transport;->open(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)Lorg/eclipse/jgit/transport/Transport;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 377
    .end local v1           #transports:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/eclipse/jgit/transport/Transport;>;"
    :goto_0
    return-object v1

    :cond_0
    invoke-static {p0, v0, p2}, Lorg/eclipse/jgit/transport/Transport;->openAll(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/RemoteConfig;Lorg/eclipse/jgit/transport/Transport$Operation;)Ljava/util/List;

    move-result-object v1

    goto :goto_0
.end method

.method public static openAll(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/RemoteConfig;)Ljava/util/List;
    .locals 1
    .parameter "local"
    .parameter "cfg"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/Repository;",
            "Lorg/eclipse/jgit/transport/RemoteConfig;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/Transport;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;,
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 458
    sget-object v0, Lorg/eclipse/jgit/transport/Transport$Operation;->FETCH:Lorg/eclipse/jgit/transport/Transport$Operation;

    invoke-static {p0, p1, v0}, Lorg/eclipse/jgit/transport/Transport;->openAll(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/RemoteConfig;Lorg/eclipse/jgit/transport/Transport$Operation;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static openAll(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/RemoteConfig;Lorg/eclipse/jgit/transport/Transport$Operation;)Ljava/util/List;
    .locals 6
    .parameter "local"
    .parameter "cfg"
    .parameter "op"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/Repository;",
            "Lorg/eclipse/jgit/transport/RemoteConfig;",
            "Lorg/eclipse/jgit/transport/Transport$Operation;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/Transport;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;,
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 482
    invoke-static {p1, p2}, Lorg/eclipse/jgit/transport/Transport;->getURIs(Lorg/eclipse/jgit/transport/RemoteConfig;Lorg/eclipse/jgit/transport/Transport$Operation;)Ljava/util/List;

    move-result-object v4

    .line 483
    .local v4, uris:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/URIish;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    invoke-direct {v2, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 484
    .local v2, transports:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/Transport;>;"
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/transport/URIish;

    .line 485
    .local v3, uri:Lorg/eclipse/jgit/transport/URIish;
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/RemoteConfig;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, v3, v5}, Lorg/eclipse/jgit/transport/Transport;->open(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)Lorg/eclipse/jgit/transport/Transport;

    move-result-object v1

    .line 486
    .local v1, tn:Lorg/eclipse/jgit/transport/Transport;
    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/transport/Transport;->applyConfig(Lorg/eclipse/jgit/transport/RemoteConfig;)V

    .line 487
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 489
    .end local v1           #tn:Lorg/eclipse/jgit/transport/Transport;
    .end local v3           #uri:Lorg/eclipse/jgit/transport/URIish;
    :cond_0
    return-object v2
.end method

.method public static register(Lorg/eclipse/jgit/transport/TransportProtocol;)V
    .locals 3
    .parameter "proto"

    .prologue
    .line 223
    sget-object v0, Lorg/eclipse/jgit/transport/Transport;->protocols:Ljava/util/List;

    const/4 v1, 0x0

    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 224
    return-void
.end method

.method private static registerByService()V
    .locals 3

    .prologue
    .line 123
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 124
    .local v1, ldr:Ljava/lang/ClassLoader;
    if-nez v1, :cond_0

    .line 125
    const-class v2, Lorg/eclipse/jgit/transport/Transport;

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 126
    :cond_0
    invoke-static {v1}, Lorg/eclipse/jgit/transport/Transport;->catalogs(Ljava/lang/ClassLoader;)Ljava/util/Enumeration;

    move-result-object v0

    .line 127
    .local v0, catalogs:Ljava/util/Enumeration;,"Ljava/util/Enumeration<Ljava/net/URL;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 128
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/net/URL;

    invoke-static {v1, v2}, Lorg/eclipse/jgit/transport/Transport;->scan(Ljava/lang/ClassLoader;Ljava/net/URL;)V

    goto :goto_0

    .line 129
    :cond_1
    return-void
.end method

.method private static scan(Ljava/lang/ClassLoader;Ljava/net/URL;)V
    .locals 7
    .parameter "ldr"
    .parameter "url"

    .prologue
    .line 144
    :try_start_0
    invoke-virtual {p1}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v4

    .line 145
    .local v4, urlIn:Ljava/io/InputStream;
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    const-string v6, "UTF-8"

    invoke-direct {v5, v4, v6}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v0, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 154
    .local v0, br:Ljava/io/BufferedReader;
    :cond_0
    :goto_0
    :try_start_1
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .local v3, line:Ljava/lang/String;
    if-eqz v3, :cond_2

    .line 155
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 156
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_0

    .line 158
    const/16 v5, 0x23

    invoke-virtual {v3, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 159
    .local v1, comment:I
    if-eqz v1, :cond_0

    .line 161
    const/4 v5, -0x1

    if-eq v1, v5, :cond_1

    .line 162
    const/4 v5, 0x0

    invoke-virtual {v3, v5, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 163
    :cond_1
    invoke-static {p0, v3}, Lorg/eclipse/jgit/transport/Transport;->load(Ljava/lang/ClassLoader;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 165
    .end local v1           #comment:I
    .end local v3           #line:Ljava/lang/String;
    :catch_0
    move-exception v5

    .line 170
    :try_start_2
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    .line 175
    .end local v0           #br:Ljava/io/BufferedReader;
    .end local v4           #urlIn:Ljava/io/InputStream;
    :goto_1
    return-void

    .line 146
    :catch_1
    move-exception v2

    .line 149
    .local v2, err:Ljava/io/IOException;
    goto :goto_1

    .line 170
    .end local v2           #err:Ljava/io/IOException;
    .restart local v0       #br:Ljava/io/BufferedReader;
    .restart local v3       #line:Ljava/lang/String;
    .restart local v4       #urlIn:Ljava/io/InputStream;
    :cond_2
    :try_start_3
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_1

    .line 171
    :catch_2
    move-exception v5

    goto :goto_1

    .line 169
    .end local v3           #line:Ljava/lang/String;
    :catchall_0
    move-exception v5

    .line 170
    :try_start_4
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4

    .line 173
    :goto_2
    throw v5

    .line 171
    :catch_3
    move-exception v5

    goto :goto_1

    :catch_4
    move-exception v6

    goto :goto_2
.end method

.method public static unregister(Lorg/eclipse/jgit/transport/TransportProtocol;)V
    .locals 4
    .parameter "proto"

    .prologue
    .line 239
    sget-object v3, Lorg/eclipse/jgit/transport/Transport;->protocols:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 240
    .local v1, ref:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lorg/eclipse/jgit/transport/TransportProtocol;>;"
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/transport/TransportProtocol;

    .line 241
    .local v2, refProto:Lorg/eclipse/jgit/transport/TransportProtocol;
    if-eqz v2, :cond_1

    if-ne v2, p0, :cond_0

    .line 242
    :cond_1
    sget-object v3, Lorg/eclipse/jgit/transport/Transport;->protocols:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    .line 244
    .end local v1           #ref:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lorg/eclipse/jgit/transport/TransportProtocol;>;"
    .end local v2           #refProto:Lorg/eclipse/jgit/transport/TransportProtocol;
    :cond_2
    return-void
.end method


# virtual methods
.method public applyConfig(Lorg/eclipse/jgit/transport/RemoteConfig;)V
    .locals 1
    .parameter "cfg"

    .prologue
    .line 963
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/RemoteConfig;->getUploadPack()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/Transport;->setOptionUploadPack(Ljava/lang/String;)V

    .line 964
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/RemoteConfig;->getReceivePack()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/Transport;->setOptionReceivePack(Ljava/lang/String;)V

    .line 965
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/RemoteConfig;->getTagOpt()Lorg/eclipse/jgit/transport/TagOpt;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/Transport;->setTagOpt(Lorg/eclipse/jgit/transport/TagOpt;)V

    .line 966
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/RemoteConfig;->getFetchRefSpecs()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/Transport;->fetch:Ljava/util/List;

    .line 967
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/RemoteConfig;->getPushRefSpecs()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/Transport;->push:Ljava/util/List;

    .line 968
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/RemoteConfig;->getTimeout()I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/transport/Transport;->timeout:I

    .line 969
    return-void
.end method

.method public abstract close()V
.end method

.method public fetch(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Collection;)Lorg/eclipse/jgit/transport/FetchResult;
    .locals 11
    .parameter "monitor"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/transport/RefSpec;",
            ">;)",
            "Lorg/eclipse/jgit/transport/FetchResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;,
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 1083
    .local p2, toFetch:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/RefSpec;>;"
    if-eqz p2, :cond_0

    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_3

    .line 1086
    :cond_0
    iget-object v9, p0, Lorg/eclipse/jgit/transport/Transport;->fetch:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 1087
    new-instance v9, Lorg/eclipse/jgit/errors/TransportException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v10

    iget-object v10, v10, Lorg/eclipse/jgit/internal/JGitText;->nothingToFetch:Ljava/lang/String;

    invoke-direct {v9, v10}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 1088
    :cond_1
    iget-object p2, p0, Lorg/eclipse/jgit/transport/Transport;->fetch:Ljava/util/List;

    .line 1110
    :cond_2
    :goto_0
    new-instance v7, Lorg/eclipse/jgit/transport/FetchResult;

    invoke-direct {v7}, Lorg/eclipse/jgit/transport/FetchResult;-><init>()V

    .line 1111
    .local v7, result:Lorg/eclipse/jgit/transport/FetchResult;
    new-instance v9, Lorg/eclipse/jgit/transport/FetchProcess;

    invoke-direct {v9, p0, p2}, Lorg/eclipse/jgit/transport/FetchProcess;-><init>(Lorg/eclipse/jgit/transport/Transport;Ljava/util/Collection;)V

    invoke-virtual {v9, p1, v7}, Lorg/eclipse/jgit/transport/FetchProcess;->execute(Lorg/eclipse/jgit/lib/ProgressMonitor;Lorg/eclipse/jgit/transport/FetchResult;)V

    .line 1112
    return-object v7

    .line 1089
    .end local v7           #result:Lorg/eclipse/jgit/transport/FetchResult;
    :cond_3
    iget-object v9, p0, Lorg/eclipse/jgit/transport/Transport;->fetch:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_2

    .line 1095
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 1096
    .local v8, tmp:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/RefSpec;>;"
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_4
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/eclipse/jgit/transport/RefSpec;

    .line 1097
    .local v6, requested:Lorg/eclipse/jgit/transport/RefSpec;
    invoke-virtual {v6}, Lorg/eclipse/jgit/transport/RefSpec;->getSource()Ljava/lang/String;

    move-result-object v5

    .line 1098
    .local v5, reqSrc:Ljava/lang/String;
    iget-object v9, p0, Lorg/eclipse/jgit/transport/Transport;->fetch:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, i$:Ljava/util/Iterator;
    :cond_5
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/transport/RefSpec;

    .line 1099
    .local v2, configured:Lorg/eclipse/jgit/transport/RefSpec;
    invoke-virtual {v2}, Lorg/eclipse/jgit/transport/RefSpec;->getSource()Ljava/lang/String;

    move-result-object v1

    .line 1100
    .local v1, cfgSrc:Ljava/lang/String;
    invoke-virtual {v2}, Lorg/eclipse/jgit/transport/RefSpec;->getDestination()Ljava/lang/String;

    move-result-object v0

    .line 1101
    .local v0, cfgDst:Ljava/lang/String;
    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_5

    if-eqz v0, :cond_5

    .line 1102
    invoke-interface {v8, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1107
    .end local v0           #cfgDst:Ljava/lang/String;
    .end local v1           #cfgSrc:Ljava/lang/String;
    .end local v2           #configured:Lorg/eclipse/jgit/transport/RefSpec;
    .end local v4           #i$:Ljava/util/Iterator;
    .end local v5           #reqSrc:Ljava/lang/String;
    .end local v6           #requested:Lorg/eclipse/jgit/transport/RefSpec;
    :cond_6
    move-object p2, v8

    goto :goto_0
.end method

.method public findRemoteRefUpdatesFor(Ljava/util/Collection;)Ljava/util/Collection;
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/transport/RefSpec;",
            ">;)",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/transport/RemoteRefUpdate;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1242
    .local p1, specs:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/RefSpec;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/transport/Transport;->local:Lorg/eclipse/jgit/lib/Repository;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/Transport;->fetch:Ljava/util/List;

    invoke-static {v0, p1, v1}, Lorg/eclipse/jgit/transport/Transport;->findRemoteRefUpdatesFor(Lorg/eclipse/jgit/lib/Repository;Ljava/util/Collection;Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public getCredentialsProvider()Lorg/eclipse/jgit/transport/CredentialsProvider;
    .locals 1

    .prologue
    .line 1052
    iget-object v0, p0, Lorg/eclipse/jgit/transport/Transport;->credentialsProvider:Lorg/eclipse/jgit/transport/CredentialsProvider;

    return-object v0
.end method

.method public getOptionReceivePack()Ljava/lang/String;
    .locals 1

    .prologue
    .line 892
    iget-object v0, p0, Lorg/eclipse/jgit/transport/Transport;->optionReceivePack:Ljava/lang/String;

    return-object v0
.end method

.method public getOptionUploadPack()Ljava/lang/String;
    .locals 1

    .prologue
    .line 807
    iget-object v0, p0, Lorg/eclipse/jgit/transport/Transport;->optionUploadPack:Ljava/lang/String;

    return-object v0
.end method

.method public getPackConfig()Lorg/eclipse/jgit/storage/pack/PackConfig;
    .locals 2

    .prologue
    .line 1019
    iget-object v0, p0, Lorg/eclipse/jgit/transport/Transport;->packConfig:Lorg/eclipse/jgit/storage/pack/PackConfig;

    if-nez v0, :cond_0

    .line 1020
    new-instance v0, Lorg/eclipse/jgit/storage/pack/PackConfig;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/Transport;->local:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/storage/pack/PackConfig;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/Transport;->packConfig:Lorg/eclipse/jgit/storage/pack/PackConfig;

    .line 1021
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/Transport;->packConfig:Lorg/eclipse/jgit/storage/pack/PackConfig;

    return-object v0
.end method

.method public getTagOpt()Lorg/eclipse/jgit/transport/TagOpt;
    .locals 1

    .prologue
    .line 829
    iget-object v0, p0, Lorg/eclipse/jgit/transport/Transport;->tagopt:Lorg/eclipse/jgit/transport/TagOpt;

    return-object v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 994
    iget v0, p0, Lorg/eclipse/jgit/transport/Transport;->timeout:I

    return v0
.end method

.method public getURI()Lorg/eclipse/jgit/transport/URIish;
    .locals 1

    .prologue
    .line 798
    iget-object v0, p0, Lorg/eclipse/jgit/transport/Transport;->uri:Lorg/eclipse/jgit/transport/URIish;

    return-object v0
.end method

.method public isCheckFetchedObjects()Z
    .locals 1

    .prologue
    .line 872
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/Transport;->checkFetchedObjects:Z

    return v0
.end method

.method public isDryRun()Z
    .locals 1

    .prologue
    .line 977
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/Transport;->dryRun:Z

    return v0
.end method

.method public isFetchThin()Z
    .locals 1

    .prologue
    .line 850
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/Transport;->fetchThin:Z

    return v0
.end method

.method public isPushThin()Z
    .locals 1

    .prologue
    .line 916
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/Transport;->pushThin:Z

    return v0
.end method

.method public isRemoveDeletedRefs()Z
    .locals 1

    .prologue
    .line 937
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/Transport;->removeDeletedRefs:Z

    return v0
.end method

.method public abstract openFetch()Lorg/eclipse/jgit/transport/FetchConnection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;,
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation
.end method

.method public abstract openPush()Lorg/eclipse/jgit/transport/PushConnection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;,
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation
.end method

.method public push(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Collection;)Lorg/eclipse/jgit/transport/PushResult;
    .locals 1
    .parameter "monitor"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/transport/RemoteRefUpdate;",
            ">;)",
            "Lorg/eclipse/jgit/transport/PushResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;,
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 1219
    .local p2, toPush:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/RemoteRefUpdate;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/eclipse/jgit/transport/Transport;->push(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Collection;Ljava/io/OutputStream;)Lorg/eclipse/jgit/transport/PushResult;

    move-result-object v0

    return-object v0
.end method

.method public push(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Collection;Ljava/io/OutputStream;)Lorg/eclipse/jgit/transport/PushResult;
    .locals 7
    .parameter "monitor"
    .parameter
    .parameter "out"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/transport/RemoteRefUpdate;",
            ">;",
            "Ljava/io/OutputStream;",
            ")",
            "Lorg/eclipse/jgit/transport/PushResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;,
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 1161
    .local p2, toPush:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/RemoteRefUpdate;>;"
    if-eqz p2, :cond_0

    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1164
    :cond_0
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jgit/transport/Transport;->push:Ljava/util/List;

    invoke-virtual {p0, v2}, Lorg/eclipse/jgit/transport/Transport;->findRemoteRefUpdatesFor(Ljava/util/Collection;)Ljava/util/Collection;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p2

    .line 1169
    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1170
    new-instance v2, Lorg/eclipse/jgit/errors/TransportException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->nothingToPush:Ljava/lang/String;

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1165
    :catch_0
    move-exception v0

    .line 1166
    .local v0, e:Ljava/io/IOException;
    new-instance v2, Lorg/eclipse/jgit/errors/TransportException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->problemWithResolvingPushRefSpecsLocally:Ljava/lang/String;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 1172
    .end local v0           #e:Ljava/io/IOException;
    :cond_1
    new-instance v1, Lorg/eclipse/jgit/transport/PushProcess;

    invoke-direct {v1, p0, p2, p3}, Lorg/eclipse/jgit/transport/PushProcess;-><init>(Lorg/eclipse/jgit/transport/Transport;Ljava/util/Collection;Ljava/io/OutputStream;)V

    .line 1173
    .local v1, pushProcess:Lorg/eclipse/jgit/transport/PushProcess;
    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/transport/PushProcess;->execute(Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/transport/PushResult;

    move-result-object v2

    return-object v2
.end method

.method public setCheckFetchedObjects(Z)V
    .locals 0
    .parameter "check"

    .prologue
    .line 881
    iput-boolean p1, p0, Lorg/eclipse/jgit/transport/Transport;->checkFetchedObjects:Z

    .line 882
    return-void
.end method

.method public setCredentialsProvider(Lorg/eclipse/jgit/transport/CredentialsProvider;)V
    .locals 0
    .parameter "credentialsProvider"

    .prologue
    .line 1042
    iput-object p1, p0, Lorg/eclipse/jgit/transport/Transport;->credentialsProvider:Lorg/eclipse/jgit/transport/CredentialsProvider;

    .line 1043
    return-void
.end method

.method public setDryRun(Z)V
    .locals 0
    .parameter "dryRun"

    .prologue
    .line 989
    iput-boolean p1, p0, Lorg/eclipse/jgit/transport/Transport;->dryRun:Z

    .line 990
    return-void
.end method

.method public setFetchThin(Z)V
    .locals 0
    .parameter "fetchThin"

    .prologue
    .line 863
    iput-boolean p1, p0, Lorg/eclipse/jgit/transport/Transport;->fetchThin:Z

    .line 864
    return-void
.end method

.method public setOptionReceivePack(Ljava/lang/String;)V
    .locals 1
    .parameter "optionReceivePack"

    .prologue
    .line 903
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 904
    iput-object p1, p0, Lorg/eclipse/jgit/transport/Transport;->optionReceivePack:Ljava/lang/String;

    .line 907
    :goto_0
    return-void

    .line 906
    :cond_0
    const-string v0, "git-receive-pack"

    iput-object v0, p0, Lorg/eclipse/jgit/transport/Transport;->optionReceivePack:Ljava/lang/String;

    goto :goto_0
.end method

.method public setOptionUploadPack(Ljava/lang/String;)V
    .locals 1
    .parameter "where"

    .prologue
    .line 817
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 818
    iput-object p1, p0, Lorg/eclipse/jgit/transport/Transport;->optionUploadPack:Ljava/lang/String;

    .line 821
    :goto_0
    return-void

    .line 820
    :cond_0
    const-string v0, "git-upload-pack"

    iput-object v0, p0, Lorg/eclipse/jgit/transport/Transport;->optionUploadPack:Ljava/lang/String;

    goto :goto_0
.end method

.method public setPackConfig(Lorg/eclipse/jgit/storage/pack/PackConfig;)V
    .locals 0
    .parameter "pc"

    .prologue
    .line 1032
    iput-object p1, p0, Lorg/eclipse/jgit/transport/Transport;->packConfig:Lorg/eclipse/jgit/storage/pack/PackConfig;

    .line 1033
    return-void
.end method

.method public setPushThin(Z)V
    .locals 0
    .parameter "pushThin"

    .prologue
    .line 929
    iput-boolean p1, p0, Lorg/eclipse/jgit/transport/Transport;->pushThin:Z

    .line 930
    return-void
.end method

.method public setRemoveDeletedRefs(Z)V
    .locals 0
    .parameter "remove"

    .prologue
    .line 953
    iput-boolean p1, p0, Lorg/eclipse/jgit/transport/Transport;->removeDeletedRefs:Z

    .line 954
    return-void
.end method

.method public setTagOpt(Lorg/eclipse/jgit/transport/TagOpt;)V
    .locals 0
    .parameter "option"

    .prologue
    .line 839
    if-eqz p1, :cond_0

    .end local p1
    :goto_0
    iput-object p1, p0, Lorg/eclipse/jgit/transport/Transport;->tagopt:Lorg/eclipse/jgit/transport/TagOpt;

    .line 840
    return-void

    .line 839
    .restart local p1
    :cond_0
    sget-object p1, Lorg/eclipse/jgit/transport/TagOpt;->AUTO_FOLLOW:Lorg/eclipse/jgit/transport/TagOpt;

    goto :goto_0
.end method

.method public setTimeout(I)V
    .locals 0
    .parameter "seconds"

    .prologue
    .line 1006
    iput p1, p0, Lorg/eclipse/jgit/transport/Transport;->timeout:I

    .line 1007
    return-void
.end method
