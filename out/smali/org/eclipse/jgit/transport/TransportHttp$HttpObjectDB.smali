.class Lorg/eclipse/jgit/transport/TransportHttp$HttpObjectDB;
.super Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;
.source "TransportHttp.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/TransportHttp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "HttpObjectDB"
.end annotation


# instance fields
.field private final objectsUrl:Ljava/net/URL;

.field final synthetic this$0:Lorg/eclipse/jgit/transport/TransportHttp;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/TransportHttp;Ljava/net/URL;)V
    .locals 0
    .parameter
    .parameter "b"

    .prologue
    .line 629
    iput-object p1, p0, Lorg/eclipse/jgit/transport/TransportHttp$HttpObjectDB;->this$0:Lorg/eclipse/jgit/transport/TransportHttp;

    invoke-direct {p0}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;-><init>()V

    .line 630
    iput-object p2, p0, Lorg/eclipse/jgit/transport/TransportHttp$HttpObjectDB;->objectsUrl:Ljava/net/URL;

    .line 631
    return-void
.end method

.method private duplicateAdvertisement(Ljava/lang/String;)Lorg/eclipse/jgit/errors/PackProtocolException;
    .locals 4
    .parameter "n"

    .prologue
    .line 751
    new-instance v0, Lorg/eclipse/jgit/errors/PackProtocolException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->duplicateAdvertisementsOf:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/PackProtocolException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private invalidAdvertisement(Ljava/lang/String;)Lorg/eclipse/jgit/errors/PackProtocolException;
    .locals 4
    .parameter "n"

    .prologue
    .line 747
    new-instance v0, Lorg/eclipse/jgit/errors/PackProtocolException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->invalidAdvertisementOf:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/PackProtocolException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private outOfOrderAdvertisement(Ljava/lang/String;)Lorg/eclipse/jgit/errors/PackProtocolException;
    .locals 4
    .parameter "n"

    .prologue
    .line 743
    new-instance v0, Lorg/eclipse/jgit/errors/PackProtocolException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->advertisementOfCameBefore:Ljava/lang/String;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    aput-object p1, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/PackProtocolException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method close()V
    .locals 0

    .prologue
    .line 757
    return-void
.end method

.method getAlternates()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 641
    :try_start_0
    const-string v0, "info/http-alternates"

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/TransportHttp$HttpObjectDB;->readAlternates(Ljava/lang/String;)Ljava/util/Collection;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 652
    :goto_0
    return-object v0

    .line 642
    :catch_0
    move-exception v0

    .line 647
    :try_start_1
    const-string v0, "info/alternates"

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/TransportHttp$HttpObjectDB;->readAlternates(Ljava/lang/String;)Ljava/util/Collection;
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v0

    goto :goto_0

    .line 648
    :catch_1
    move-exception v0

    .line 652
    const/4 v0, 0x0

    goto :goto_0
.end method

.method getPackNames()Ljava/util/Collection;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 663
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 665
    .local v2, packs:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    :try_start_0
    const-string v4, "info/packs"

    invoke-virtual {p0, v4}, Lorg/eclipse/jgit/transport/TransportHttp$HttpObjectDB;->openReader(Ljava/lang/String;)Ljava/io/BufferedReader;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 668
    .local v0, br:Ljava/io/BufferedReader;
    :goto_0
    :try_start_1
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .line 669
    .local v3, s:Ljava/lang/String;
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Ljava/lang/String;->length()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v4

    if-nez v4, :cond_1

    .line 677
    :cond_0
    :try_start_2
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_0

    .line 680
    .end local v0           #br:Ljava/io/BufferedReader;
    .end local v3           #s:Ljava/lang/String;
    :goto_1
    return-object v2

    .line 671
    .restart local v0       #br:Ljava/io/BufferedReader;
    .restart local v3       #s:Ljava/lang/String;
    :cond_1
    :try_start_3
    const-string v4, "P pack-"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    const-string v4, ".pack"

    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 672
    :cond_2
    invoke-direct {p0, v3}, Lorg/eclipse/jgit/transport/TransportHttp$HttpObjectDB;->invalidAdvertisement(Ljava/lang/String;)Lorg/eclipse/jgit/errors/PackProtocolException;

    move-result-object v4

    throw v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 677
    .end local v3           #s:Ljava/lang/String;
    :catchall_0
    move-exception v4

    :try_start_4
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    throw v4
    :try_end_4
    .catch Ljava/io/FileNotFoundException; {:try_start_4 .. :try_end_4} :catch_0

    .line 679
    .end local v0           #br:Ljava/io/BufferedReader;
    :catch_0
    move-exception v1

    .line 680
    .local v1, err:Ljava/io/FileNotFoundException;
    goto :goto_1

    .line 673
    .end local v1           #err:Ljava/io/FileNotFoundException;
    .restart local v0       #br:Ljava/io/BufferedReader;
    .restart local v3       #s:Ljava/lang/String;
    :cond_3
    const/4 v4, 0x2

    :try_start_5
    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_0
.end method

.method getURI()Lorg/eclipse/jgit/transport/URIish;
    .locals 2

    .prologue
    .line 635
    new-instance v0, Lorg/eclipse/jgit/transport/URIish;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportHttp$HttpObjectDB;->objectsUrl:Ljava/net/URL;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/transport/URIish;-><init>(Ljava/net/URL;)V

    return-object v0
.end method

.method open(Ljava/lang/String;)Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;
    .locals 8
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 686
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$HttpObjectDB;->objectsUrl:Ljava/net/URL;

    .line 687
    .local v0, base:Ljava/net/URL;
    new-instance v4, Ljava/net/URL;

    invoke-direct {v4, v0, p1}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    .line 688
    .local v4, u:Ljava/net/URL;
    iget-object v5, p0, Lorg/eclipse/jgit/transport/TransportHttp$HttpObjectDB;->this$0:Lorg/eclipse/jgit/transport/TransportHttp;

    invoke-virtual {v5, v4}, Lorg/eclipse/jgit/transport/TransportHttp;->httpOpen(Ljava/net/URL;)Lorg/eclipse/jgit/transport/http/HttpConnection;

    move-result-object v1

    .line 689
    .local v1, c:Lorg/eclipse/jgit/transport/http/HttpConnection;
    invoke-static {v1}, Lorg/eclipse/jgit/util/HttpSupport;->response(Lorg/eclipse/jgit/transport/http/HttpConnection;)I

    move-result v5

    sparse-switch v5, :sswitch_data_0

    .line 697
    new-instance v5, Ljava/io/IOException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ": "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {v1}, Lorg/eclipse/jgit/util/HttpSupport;->response(Lorg/eclipse/jgit/transport/http/HttpConnection;)I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v1}, Lorg/eclipse/jgit/transport/http/HttpConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 691
    :sswitch_0
    iget-object v5, p0, Lorg/eclipse/jgit/transport/TransportHttp$HttpObjectDB;->this$0:Lorg/eclipse/jgit/transport/TransportHttp;

    invoke-virtual {v5, v1}, Lorg/eclipse/jgit/transport/TransportHttp;->openInputStream(Lorg/eclipse/jgit/transport/http/HttpConnection;)Ljava/io/InputStream;

    move-result-object v2

    .line 692
    .local v2, in:Ljava/io/InputStream;
    invoke-interface {v1}, Lorg/eclipse/jgit/transport/http/HttpConnection;->getContentLength()I

    move-result v3

    .line 693
    .local v3, len:I
    new-instance v5, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;

    int-to-long v6, v3

    invoke-direct {v5, v2, v6, v7}, Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase$FileStream;-><init>(Ljava/io/InputStream;J)V

    return-object v5

    .line 695
    .end local v2           #in:Ljava/io/InputStream;
    .end local v3           #len:I
    :sswitch_1
    new-instance v5, Ljava/io/FileNotFoundException;

    invoke-virtual {v4}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 689
    :sswitch_data_0
    .sparse-switch
        0xc8 -> :sswitch_0
        0x194 -> :sswitch_1
    .end sparse-switch
.end method

.method openAlternate(Ljava/lang/String;)Lorg/eclipse/jgit/transport/WalkRemoteObjectDatabase;
    .locals 4
    .parameter "location"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 658
    new-instance v0, Lorg/eclipse/jgit/transport/TransportHttp$HttpObjectDB;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/TransportHttp$HttpObjectDB;->this$0:Lorg/eclipse/jgit/transport/TransportHttp;

    new-instance v2, Ljava/net/URL;

    iget-object v3, p0, Lorg/eclipse/jgit/transport/TransportHttp$HttpObjectDB;->objectsUrl:Ljava/net/URL;

    invoke-direct {v2, v3, p1}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/transport/TransportHttp$HttpObjectDB;-><init>(Lorg/eclipse/jgit/transport/TransportHttp;Ljava/net/URL;)V

    return-object v0
.end method

.method readAdvertisedImpl(Ljava/io/BufferedReader;)Ljava/util/Map;
    .locals 10
    .parameter "br"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/BufferedReader;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/PackProtocolException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 705
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    .line 707
    .local v0, avail:Ljava/util/TreeMap;,"Ljava/util/TreeMap<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    :cond_0
    :goto_0
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    .line 708
    .local v2, line:Ljava/lang/String;
    if-nez v2, :cond_1

    .line 739
    return-object v0

    .line 711
    :cond_1
    const/16 v6, 0x9

    invoke-virtual {v2, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    .line 712
    .local v5, tab:I
    if-gez v5, :cond_2

    .line 713
    invoke-direct {p0, v2}, Lorg/eclipse/jgit/transport/TransportHttp$HttpObjectDB;->invalidAdvertisement(Ljava/lang/String;)Lorg/eclipse/jgit/errors/PackProtocolException;

    move-result-object v6

    throw v6

    .line 718
    :cond_2
    add-int/lit8 v6, v5, 0x1

    invoke-virtual {v2, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 719
    .local v3, name:Ljava/lang/String;
    invoke-virtual {v2, v9, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lorg/eclipse/jgit/lib/ObjectId;->fromString(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    .line 720
    .local v1, id:Lorg/eclipse/jgit/lib/ObjectId;
    const-string v6, "^{}"

    invoke-virtual {v3, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 721
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x3

    invoke-virtual {v3, v9, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 722
    invoke-virtual {v0, v3}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/lib/Ref;

    .line 723
    .local v4, prior:Lorg/eclipse/jgit/lib/Ref;
    if-nez v4, :cond_3

    .line 724
    invoke-direct {p0, v3}, Lorg/eclipse/jgit/transport/TransportHttp$HttpObjectDB;->outOfOrderAdvertisement(Ljava/lang/String;)Lorg/eclipse/jgit/errors/PackProtocolException;

    move-result-object v6

    throw v6

    .line 726
    :cond_3
    invoke-interface {v4}, Lorg/eclipse/jgit/lib/Ref;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    if-eqz v6, :cond_4

    .line 727
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "^{}"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lorg/eclipse/jgit/transport/TransportHttp$HttpObjectDB;->duplicateAdvertisement(Ljava/lang/String;)Lorg/eclipse/jgit/errors/PackProtocolException;

    move-result-object v6

    throw v6

    .line 729
    :cond_4
    new-instance v6, Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledTag;

    sget-object v7, Lorg/eclipse/jgit/lib/Ref$Storage;->NETWORK:Lorg/eclipse/jgit/lib/Ref$Storage;

    invoke-interface {v4}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v8

    invoke-direct {v6, v7, v3, v8, v1}, Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledTag;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;)V

    invoke-virtual {v0, v3, v6}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 733
    .end local v4           #prior:Lorg/eclipse/jgit/lib/Ref;
    :cond_5
    new-instance v6, Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledNonTag;

    sget-object v7, Lorg/eclipse/jgit/lib/Ref$Storage;->NETWORK:Lorg/eclipse/jgit/lib/Ref$Storage;

    invoke-direct {v6, v7, v3, v1}, Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledNonTag;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    invoke-virtual {v0, v3, v6}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/lib/Ref;

    .line 735
    .restart local v4       #prior:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v4, :cond_0

    .line 736
    invoke-direct {p0, v3}, Lorg/eclipse/jgit/transport/TransportHttp$HttpObjectDB;->duplicateAdvertisement(Ljava/lang/String;)Lorg/eclipse/jgit/errors/PackProtocolException;

    move-result-object v6

    throw v6
.end method
