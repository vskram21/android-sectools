.class public abstract Lorg/eclipse/jgit/transport/BasePackFetchConnection;
.super Lorg/eclipse/jgit/transport/BasePackConnection;
.source "BasePackFetchConnection.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/FetchConnection;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/transport/BasePackFetchConnection$2;,
        Lorg/eclipse/jgit/transport/BasePackFetchConnection$CancelledException;,
        Lorg/eclipse/jgit/transport/BasePackFetchConnection$FetchConfig;
    }
.end annotation


# static fields
.field private static final MAX_HAVES:I = 0x100

.field protected static final MIN_CLIENT_BUFFER:I = 0xb88

.field public static final OPTION_ALLOW_TIP_SHA1_IN_WANT:Ljava/lang/String; = "allow-tip-sha1-in-want"

.field public static final OPTION_INCLUDE_TAG:Ljava/lang/String; = "include-tag"

.field public static final OPTION_MULTI_ACK:Ljava/lang/String; = "multi_ack"

.field public static final OPTION_MULTI_ACK_DETAILED:Ljava/lang/String; = "multi_ack_detailed"

.field public static final OPTION_NO_DONE:Ljava/lang/String; = "no-done"

.field public static final OPTION_NO_PROGRESS:Ljava/lang/String; = "no-progress"

.field public static final OPTION_OFS_DELTA:Ljava/lang/String; = "ofs-delta"

.field public static final OPTION_SHALLOW:Ljava/lang/String; = "shallow"

.field public static final OPTION_SIDE_BAND:Ljava/lang/String; = "side-band"

.field public static final OPTION_SIDE_BAND_64K:Ljava/lang/String; = "side-band-64k"

.field public static final OPTION_THIN_PACK:Ljava/lang/String; = "thin-pack"


# instance fields
.field final ADVERTISED:Lorg/eclipse/jgit/revwalk/RevFlag;

.field final COMMON:Lorg/eclipse/jgit/revwalk/RevFlag;

.field final REACHABLE:Lorg/eclipse/jgit/revwalk/RevFlag;

.field private final STATE:Lorg/eclipse/jgit/revwalk/RevFlag;

.field private allowOfsDelta:Z

.field private includeTags:Z

.field private lockMessage:Ljava/lang/String;

.field private multiAck:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

.field private noDone:Z

.field private noProgress:Z

.field private packLock:Lorg/eclipse/jgit/internal/storage/file/PackLock;

.field private pckState:Lorg/eclipse/jgit/transport/PacketLineOut;

.field private reachableCommits:Lorg/eclipse/jgit/revwalk/RevCommitList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/revwalk/RevCommitList",
            "<",
            "Lorg/eclipse/jgit/revwalk/RevCommit;",
            ">;"
        }
    .end annotation
.end field

.field private sideband:Z

.field private state:Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;

.field private thinPack:Z

.field private final walk:Lorg/eclipse/jgit/revwalk/RevWalk;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/transport/PackTransport;)V
    .locals 5
    .parameter "packTransport"

    .prologue
    const/4 v1, 0x1

    const/4 v4, 0x0

    .line 243
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/BasePackConnection;-><init>(Lorg/eclipse/jgit/transport/PackTransport;)V

    .line 213
    sget-object v2, Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;->OFF:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    iput-object v2, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->multiAck:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    .line 245
    iget-object v2, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->local:Lorg/eclipse/jgit/lib/Repository;

    if-eqz v2, :cond_0

    .line 246
    iget-object v2, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->local:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v2

    sget-object v3, Lorg/eclipse/jgit/transport/BasePackFetchConnection$FetchConfig;->KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/lib/StoredConfig;->get(Lorg/eclipse/jgit/lib/Config$SectionParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/transport/BasePackFetchConnection$FetchConfig;

    .line 247
    .local v0, cfg:Lorg/eclipse/jgit/transport/BasePackFetchConnection$FetchConfig;
    iget-boolean v2, v0, Lorg/eclipse/jgit/transport/BasePackFetchConnection$FetchConfig;->allowOfsDelta:Z

    iput-boolean v2, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->allowOfsDelta:Z

    .line 251
    .end local v0           #cfg:Lorg/eclipse/jgit/transport/BasePackFetchConnection$FetchConfig;
    :goto_0
    iget-object v2, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->transport:Lorg/eclipse/jgit/transport/Transport;

    invoke-virtual {v2}, Lorg/eclipse/jgit/transport/Transport;->getTagOpt()Lorg/eclipse/jgit/transport/TagOpt;

    move-result-object v2

    sget-object v3, Lorg/eclipse/jgit/transport/TagOpt;->NO_TAGS:Lorg/eclipse/jgit/transport/TagOpt;

    if-eq v2, v3, :cond_1

    :goto_1
    iput-boolean v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->includeTags:Z

    .line 252
    iget-object v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->transport:Lorg/eclipse/jgit/transport/Transport;

    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/Transport;->isFetchThin()Z

    move-result v1

    iput-boolean v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->thinPack:Z

    .line 254
    iget-object v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->local:Lorg/eclipse/jgit/lib/Repository;

    if-eqz v1, :cond_2

    .line 255
    new-instance v1, Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->local:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    iput-object v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    .line 256
    new-instance v1, Lorg/eclipse/jgit/revwalk/RevCommitList;

    invoke-direct {v1}, Lorg/eclipse/jgit/revwalk/RevCommitList;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->reachableCommits:Lorg/eclipse/jgit/revwalk/RevCommitList;

    .line 257
    iget-object v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    const-string v2, "REACHABLE"

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->newFlag(Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevFlag;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->REACHABLE:Lorg/eclipse/jgit/revwalk/RevFlag;

    .line 258
    iget-object v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    const-string v2, "COMMON"

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->newFlag(Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevFlag;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->COMMON:Lorg/eclipse/jgit/revwalk/RevFlag;

    .line 259
    iget-object v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    const-string v2, "STATE"

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->newFlag(Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevFlag;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->STATE:Lorg/eclipse/jgit/revwalk/RevFlag;

    .line 260
    iget-object v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    const-string v2, "ADVERTISED"

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->newFlag(Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevFlag;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->ADVERTISED:Lorg/eclipse/jgit/revwalk/RevFlag;

    .line 262
    iget-object v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->COMMON:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->carry(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 263
    iget-object v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->REACHABLE:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->carry(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 264
    iget-object v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->ADVERTISED:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->carry(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 272
    :goto_2
    return-void

    .line 249
    :cond_0
    iput-boolean v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->allowOfsDelta:Z

    goto :goto_0

    .line 251
    :cond_1
    const/4 v1, 0x0

    goto :goto_1

    .line 266
    :cond_2
    iput-object v4, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    .line 267
    iput-object v4, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->REACHABLE:Lorg/eclipse/jgit/revwalk/RevFlag;

    .line 268
    iput-object v4, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->COMMON:Lorg/eclipse/jgit/revwalk/RevFlag;

    .line 269
    iput-object v4, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->STATE:Lorg/eclipse/jgit/revwalk/RevFlag;

    .line 270
    iput-object v4, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->ADVERTISED:Lorg/eclipse/jgit/revwalk/RevFlag;

    goto :goto_2
.end method

.method private enableCapabilities()Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 490
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 491
    .local v0, line:Ljava/lang/StringBuilder;
    iget-boolean v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->noProgress:Z

    if-eqz v1, :cond_0

    .line 492
    const-string v1, "no-progress"

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->wantCapability(Ljava/lang/StringBuilder;Ljava/lang/String;)Z

    .line 493
    :cond_0
    iget-boolean v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->includeTags:Z

    if-eqz v1, :cond_1

    .line 494
    const-string v1, "include-tag"

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->wantCapability(Ljava/lang/StringBuilder;Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->includeTags:Z

    .line 495
    :cond_1
    iget-boolean v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->allowOfsDelta:Z

    if-eqz v1, :cond_2

    .line 496
    const-string v1, "ofs-delta"

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->wantCapability(Ljava/lang/StringBuilder;Ljava/lang/String;)Z

    .line 498
    :cond_2
    const-string v1, "multi_ack_detailed"

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->wantCapability(Ljava/lang/StringBuilder;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 499
    sget-object v1, Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;->DETAILED:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    iput-object v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->multiAck:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    .line 500
    iget-boolean v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->statelessRPC:Z

    if-eqz v1, :cond_3

    .line 501
    const-string v1, "no-done"

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->wantCapability(Ljava/lang/StringBuilder;Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->noDone:Z

    .line 507
    :cond_3
    :goto_0
    iget-boolean v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->thinPack:Z

    if-eqz v1, :cond_4

    .line 508
    const-string v1, "thin-pack"

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->wantCapability(Ljava/lang/StringBuilder;Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->thinPack:Z

    .line 509
    :cond_4
    const-string v1, "side-band-64k"

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->wantCapability(Ljava/lang/StringBuilder;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 510
    iput-boolean v4, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->sideband:Z

    .line 514
    :cond_5
    :goto_1
    iget-boolean v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->statelessRPC:Z

    if-eqz v1, :cond_9

    iget-object v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->multiAck:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    sget-object v2, Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;->DETAILED:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    if-eq v1, v2, :cond_9

    .line 519
    new-instance v1, Lorg/eclipse/jgit/errors/PackProtocolException;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->statelessRPCRequiresOptionToBeEnabled:Ljava/lang/String;

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v6, "multi_ack_detailed"

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/eclipse/jgit/errors/PackProtocolException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    throw v1

    .line 502
    :cond_6
    const-string v1, "multi_ack"

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->wantCapability(Ljava/lang/StringBuilder;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 503
    sget-object v1, Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;->CONTINUE:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    iput-object v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->multiAck:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    goto :goto_0

    .line 505
    :cond_7
    sget-object v1, Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;->OFF:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    iput-object v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->multiAck:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    goto :goto_0

    .line 511
    :cond_8
    const-string v1, "side-band"

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->wantCapability(Ljava/lang/StringBuilder;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 512
    iput-boolean v4, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->sideband:Z

    goto :goto_1

    .line 524
    :cond_9
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private markAdvertised(Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 2
    .parameter "id"

    .prologue
    .line 725
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->ADVERTISED:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevObject;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 729
    :goto_0
    return-void

    .line 726
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private markCommon(Lorg/eclipse/jgit/revwalk/RevObject;Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;)V
    .locals 3
    .parameter "obj"
    .parameter "anr"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 733
    iget-boolean v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->statelessRPC:Z

    if-eqz v1, :cond_0

    sget-object v1, Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;->ACK_COMMON:Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;

    if-ne p2, v1, :cond_0

    iget-object v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->STATE:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {p1, v1}, Lorg/eclipse/jgit/revwalk/RevObject;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 736
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x2e

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 737
    .local v0, s:Ljava/lang/StringBuilder;
    const-string v1, "have "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 738
    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevObject;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 739
    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 740
    iget-object v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->pckState:Lorg/eclipse/jgit/transport/PacketLineOut;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/transport/PacketLineOut;->writeString(Ljava/lang/String;)V

    .line 741
    iget-object v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->STATE:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {p1, v1}, Lorg/eclipse/jgit/revwalk/RevObject;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 743
    .end local v0           #s:Ljava/lang/StringBuilder;
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->COMMON:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {p1, v1}, Lorg/eclipse/jgit/revwalk/RevObject;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 744
    instance-of v1, p1, Lorg/eclipse/jgit/revwalk/RevCommit;

    if-eqz v1, :cond_1

    .line 745
    check-cast p1, Lorg/eclipse/jgit/revwalk/RevCommit;

    .end local p1
    iget-object v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->COMMON:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {p1, v1}, Lorg/eclipse/jgit/revwalk/RevCommit;->carry(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 746
    :cond_1
    return-void
.end method

.method private markReachable(Ljava/util/Set;I)V
    .locals 10
    .parameter
    .parameter "maxTime"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;I)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 403
    .local p1, have:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    iget-object v6, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->local:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/Repository;->getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;

    move-result-object v6

    const-string v7, ""

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/lib/RefDatabase;->getRefs(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v5

    .line 404
    .local v5, refs:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-interface {v5}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/lib/Ref;

    .line 405
    .local v4, r:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v4}, Lorg/eclipse/jgit/lib/Ref;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    .line 406
    .local v2, id:Lorg/eclipse/jgit/lib/ObjectId;
    if-nez v2, :cond_1

    .line 407
    invoke-interface {v4}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    .line 408
    :cond_1
    if-eqz v2, :cond_0

    .line 410
    invoke-direct {p0, v2}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->parseReachable(Lorg/eclipse/jgit/lib/ObjectId;)V

    goto :goto_0

    .line 413
    .end local v2           #id:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v4           #r:Lorg/eclipse/jgit/lib/Ref;
    :cond_2
    iget-object v6, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->local:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/Repository;->getAdditionalHaves()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/lib/ObjectId;

    .line 414
    .restart local v2       #id:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-direct {p0, v2}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->parseReachable(Lorg/eclipse/jgit/lib/ObjectId;)V

    goto :goto_1

    .line 416
    .end local v2           #id:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_3
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/lib/ObjectId;

    .line 417
    .restart local v2       #id:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-direct {p0, v2}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->parseReachable(Lorg/eclipse/jgit/lib/ObjectId;)V

    goto :goto_2

    .line 419
    .end local v2           #id:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_4
    if-lez p2, :cond_6

    .line 424
    new-instance v3, Ljava/util/Date;

    int-to-long v6, p2

    const-wide/16 v8, 0x3e8

    mul-long/2addr v6, v8

    invoke-direct {v3, v6, v7}, Ljava/util/Date;-><init>(J)V

    .line 425
    .local v3, maxWhen:Ljava/util/Date;
    iget-object v6, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    sget-object v7, Lorg/eclipse/jgit/revwalk/RevSort;->COMMIT_TIME_DESC:Lorg/eclipse/jgit/revwalk/RevSort;

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/revwalk/RevWalk;->sort(Lorg/eclipse/jgit/revwalk/RevSort;)V

    .line 426
    iget-object v6, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v7, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->reachableCommits:Lorg/eclipse/jgit/revwalk/RevCommitList;

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/revwalk/RevWalk;->markStart(Ljava/util/Collection;)V

    .line 427
    iget-object v6, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-static {v3}, Lorg/eclipse/jgit/revwalk/filter/CommitTimeRevFilter;->after(Ljava/util/Date;)Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/revwalk/RevWalk;->setRevFilter(Lorg/eclipse/jgit/revwalk/filter/RevFilter;)V

    .line 429
    :cond_5
    :goto_3
    iget-object v6, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v6}, Lorg/eclipse/jgit/revwalk/RevWalk;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    .line 430
    .local v0, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-nez v0, :cond_7

    .line 442
    .end local v0           #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v3           #maxWhen:Ljava/util/Date;
    :cond_6
    return-void

    .line 432
    .restart local v0       #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    .restart local v3       #maxWhen:Ljava/util/Date;
    :cond_7
    iget-object v6, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->ADVERTISED:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v0, v6}, Lorg/eclipse/jgit/revwalk/RevCommit;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v6

    if-eqz v6, :cond_5

    iget-object v6, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->COMMON:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v0, v6}, Lorg/eclipse/jgit/revwalk/RevCommit;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v6

    if-nez v6, :cond_5

    .line 436
    iget-object v6, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->COMMON:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v0, v6}, Lorg/eclipse/jgit/revwalk/RevCommit;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 437
    iget-object v6, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->COMMON:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v0, v6}, Lorg/eclipse/jgit/revwalk/RevCommit;->carry(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 438
    iget-object v6, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->reachableCommits:Lorg/eclipse/jgit/revwalk/RevCommitList;

    invoke-virtual {v6, v0}, Lorg/eclipse/jgit/revwalk/RevCommitList;->add(Ljava/lang/Object;)Z

    goto :goto_3
.end method

.method private markRefsAdvertised()V
    .locals 3

    .prologue
    .line 716
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->getRefs()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/lib/Ref;

    .line 717
    .local v1, r:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->markAdvertised(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 718
    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 719
    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->markAdvertised(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    goto :goto_0

    .line 721
    .end local v1           #r:Lorg/eclipse/jgit/lib/Ref;
    :cond_1
    return-void
.end method

.method private maxTimeWanted(Ljava/util/Collection;)I
    .locals 7
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 385
    .local p1, wants:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/Ref;>;"
    const/4 v2, 0x0

    .line 386
    .local v2, maxTime:I
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/lib/Ref;

    .line 388
    .local v4, r:Lorg/eclipse/jgit/lib/Ref;
    :try_start_0
    iget-object v5, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-interface {v4}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v3

    .line 389
    .local v3, obj:Lorg/eclipse/jgit/revwalk/RevObject;
    instance-of v5, v3, Lorg/eclipse/jgit/revwalk/RevCommit;

    if-eqz v5, :cond_0

    .line 390
    check-cast v3, Lorg/eclipse/jgit/revwalk/RevCommit;

    .end local v3           #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    invoke-virtual {v3}, Lorg/eclipse/jgit/revwalk/RevCommit;->getCommitTime()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 391
    .local v0, cTime:I
    if-ge v2, v0, :cond_0

    .line 392
    move v2, v0

    goto :goto_0

    .line 398
    .end local v0           #cTime:I
    .end local v4           #r:Lorg/eclipse/jgit/lib/Ref;
    :cond_1
    return v2

    .line 394
    .restart local v4       #r:Lorg/eclipse/jgit/lib/Ref;
    :catch_0
    move-exception v5

    goto :goto_0
.end method

.method private negotiate(Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    .locals 13
    .parameter "monitor"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/transport/BasePackFetchConnection$CancelledException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x0

    .line 529
    new-instance v0, Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/MutableObjectId;-><init>()V

    .line 530
    .local v0, ackId:Lorg/eclipse/jgit/lib/MutableObjectId;
    const/4 v8, 0x0

    .line 531
    .local v8, resultsPending:I
    const/4 v3, 0x0

    .line 532
    .local v3, havesSent:I
    const/4 v4, 0x0

    .line 533
    .local v4, havesSinceLastContinue:I
    const/4 v6, 0x0

    .line 534
    .local v6, receivedContinue:Z
    const/4 v5, 0x0

    .line 535
    .local v5, receivedAck:Z
    const/4 v7, 0x0

    .line 537
    .local v7, receivedReady:Z
    iget-boolean v9, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->statelessRPC:Z

    if-eqz v9, :cond_0

    .line 538
    iget-object v9, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->state:Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;

    iget-object v10, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->out:Ljava/io/OutputStream;

    invoke-virtual {v9, v10, v12}, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;->writeTo(Ljava/io/OutputStream;Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 540
    :cond_0
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->negotiateBegin()V

    .line 542
    :cond_1
    iget-object v9, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v9}, Lorg/eclipse/jgit/revwalk/RevWalk;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v2

    .line 543
    .local v2, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-nez v2, :cond_3

    .line 633
    :cond_2
    :goto_0
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->isCancelled()Z

    move-result v9

    if-eqz v9, :cond_8

    .line 634
    new-instance v9, Lorg/eclipse/jgit/transport/BasePackFetchConnection$CancelledException;

    invoke-direct {v9, v12}, Lorg/eclipse/jgit/transport/BasePackFetchConnection$CancelledException;-><init>(Lorg/eclipse/jgit/transport/BasePackFetchConnection$1;)V

    throw v9

    .line 546
    :cond_3
    iget-object v9, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "have "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/RevCommit;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v11

    invoke-virtual {v11}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Lorg/eclipse/jgit/transport/PacketLineOut;->writeString(Ljava/lang/String;)V

    .line 547
    add-int/lit8 v3, v3, 0x1

    .line 548
    add-int/lit8 v4, v4, 0x1

    .line 550
    and-int/lit8 v9, v3, 0x1f

    if-nez v9, :cond_1

    .line 558
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->isCancelled()Z

    move-result v9

    if-eqz v9, :cond_4

    .line 559
    new-instance v9, Lorg/eclipse/jgit/transport/BasePackFetchConnection$CancelledException;

    invoke-direct {v9, v12}, Lorg/eclipse/jgit/transport/BasePackFetchConnection$CancelledException;-><init>(Lorg/eclipse/jgit/transport/BasePackFetchConnection$1;)V

    throw v9

    .line 561
    :cond_4
    iget-object v9, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    invoke-virtual {v9}, Lorg/eclipse/jgit/transport/PacketLineOut;->end()V

    .line 562
    add-int/lit8 v8, v8, 0x1

    .line 564
    const/16 v9, 0x20

    if-ne v3, v9, :cond_5

    iget-boolean v9, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->statelessRPC:Z

    if-eqz v9, :cond_1

    .line 574
    :cond_5
    iget-object v9, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->pckIn:Lorg/eclipse/jgit/transport/PacketLineIn;

    invoke-virtual {v9, v0}, Lorg/eclipse/jgit/transport/PacketLineIn;->readACK(Lorg/eclipse/jgit/lib/MutableObjectId;)Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;

    move-result-object v1

    .line 575
    .local v1, anr:Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;
    sget-object v9, Lorg/eclipse/jgit/transport/BasePackFetchConnection$2;->$SwitchMap$org$eclipse$jgit$transport$PacketLineIn$AckNackResult:[I

    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;->ordinal()I

    move-result v10

    aget v9, v9, v10

    packed-switch v9, :pswitch_data_0

    .line 612
    :cond_6
    :goto_1
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->isCancelled()Z

    move-result v9

    if-eqz v9, :cond_5

    .line 613
    new-instance v9, Lorg/eclipse/jgit/transport/BasePackFetchConnection$CancelledException;

    invoke-direct {v9, v12}, Lorg/eclipse/jgit/transport/BasePackFetchConnection$CancelledException;-><init>(Lorg/eclipse/jgit/transport/BasePackFetchConnection$1;)V

    throw v9

    .line 580
    :pswitch_0
    add-int/lit8 v8, v8, -0x1

    .line 616
    iget-boolean v9, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->noDone:Z

    and-int/2addr v9, v7

    if-nez v9, :cond_2

    .line 618
    iget-boolean v9, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->statelessRPC:Z

    if-eqz v9, :cond_7

    .line 619
    iget-object v9, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->state:Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;

    iget-object v10, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->out:Ljava/io/OutputStream;

    invoke-virtual {v9, v10, v12}, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;->writeTo(Ljava/io/OutputStream;Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 621
    :cond_7
    if-eqz v6, :cond_1

    const/16 v9, 0x100

    if-le v4, v9, :cond_1

    goto/16 :goto_0

    .line 588
    :pswitch_1
    sget-object v9, Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;->OFF:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    iput-object v9, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->multiAck:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    .line 589
    const/4 v8, 0x0

    .line 590
    const/4 v5, 0x1

    .line 591
    iget-boolean v9, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->statelessRPC:Z

    if-eqz v9, :cond_2

    .line 592
    iget-object v9, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->state:Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;

    iget-object v10, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->out:Ljava/io/OutputStream;

    invoke-virtual {v9, v10, v12}, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;->writeTo(Ljava/io/OutputStream;Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    goto/16 :goto_0

    .line 603
    :pswitch_2
    iget-object v9, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v9, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v9

    invoke-direct {p0, v9, v1}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->markCommon(Lorg/eclipse/jgit/revwalk/RevObject;Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;)V

    .line 604
    const/4 v5, 0x1

    .line 605
    const/4 v6, 0x1

    .line 606
    const/4 v4, 0x0

    .line 607
    sget-object v9, Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;->ACK_READY:Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;

    if-ne v1, v9, :cond_6

    .line 608
    const/4 v7, 0x1

    goto :goto_1

    .line 636
    .end local v1           #anr:Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;
    :cond_8
    if-eqz v7, :cond_9

    iget-boolean v9, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->noDone:Z

    if-nez v9, :cond_a

    .line 641
    :cond_9
    iget-object v9, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    const-string v10, "done\n"

    invoke-virtual {v9, v10}, Lorg/eclipse/jgit/transport/PacketLineOut;->writeString(Ljava/lang/String;)V

    .line 642
    iget-object v9, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    invoke-virtual {v9}, Lorg/eclipse/jgit/transport/PacketLineOut;->flush()V

    .line 645
    :cond_a
    if-nez v5, :cond_b

    .line 650
    sget-object v9, Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;->OFF:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    iput-object v9, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->multiAck:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    .line 651
    add-int/lit8 v8, v8, 0x1

    .line 654
    :cond_b
    if-gtz v8, :cond_c

    iget-object v9, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->multiAck:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    sget-object v10, Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;->OFF:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    if-eq v9, v10, :cond_d

    .line 655
    :cond_c
    iget-object v9, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->pckIn:Lorg/eclipse/jgit/transport/PacketLineIn;

    invoke-virtual {v9, v0}, Lorg/eclipse/jgit/transport/PacketLineIn;->readACK(Lorg/eclipse/jgit/lib/MutableObjectId;)Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;

    move-result-object v1

    .line 656
    .restart local v1       #anr:Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;
    add-int/lit8 v8, v8, -0x1

    .line 657
    sget-object v9, Lorg/eclipse/jgit/transport/BasePackFetchConnection$2;->$SwitchMap$org$eclipse$jgit$transport$PacketLineIn$AckNackResult:[I

    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;->ordinal()I

    move-result v10

    aget v9, v9, v10

    packed-switch v9, :pswitch_data_1

    .line 679
    :goto_2
    :pswitch_3
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->isCancelled()Z

    move-result v9

    if-eqz v9, :cond_b

    .line 680
    new-instance v9, Lorg/eclipse/jgit/transport/BasePackFetchConnection$CancelledException;

    invoke-direct {v9, v12}, Lorg/eclipse/jgit/transport/BasePackFetchConnection$CancelledException;-><init>(Lorg/eclipse/jgit/transport/BasePackFetchConnection$1;)V

    throw v9

    .line 675
    :pswitch_4
    sget-object v9, Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;->CONTINUE:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    iput-object v9, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->multiAck:Lorg/eclipse/jgit/transport/GitProtocolConstants$MultiAck;

    goto :goto_2

    .line 682
    .end local v1           #anr:Lorg/eclipse/jgit/transport/PacketLineIn$AckNackResult;
    :cond_d
    :pswitch_5
    return-void

    .line 575
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_2
    .end packed-switch

    .line 657
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_3
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_4
    .end packed-switch
.end method

.method private negotiateBegin()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 685
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    const/4 v1, 0x2

    new-array v1, v1, [Lorg/eclipse/jgit/revwalk/RevFlag;

    const/4 v2, 0x0

    iget-object v3, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->REACHABLE:Lorg/eclipse/jgit/revwalk/RevFlag;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->ADVERTISED:Lorg/eclipse/jgit/revwalk/RevFlag;

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->resetRetain([Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 686
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->reachableCommits:Lorg/eclipse/jgit/revwalk/RevCommitList;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->markStart(Ljava/util/Collection;)V

    .line 687
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    sget-object v1, Lorg/eclipse/jgit/revwalk/RevSort;->COMMIT_TIME_DESC:Lorg/eclipse/jgit/revwalk/RevSort;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->sort(Lorg/eclipse/jgit/revwalk/RevSort;)V

    .line 688
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    new-instance v1, Lorg/eclipse/jgit/transport/BasePackFetchConnection$1;

    invoke-direct {v1, p0}, Lorg/eclipse/jgit/transport/BasePackFetchConnection$1;-><init>(Lorg/eclipse/jgit/transport/BasePackFetchConnection;)V

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->setRevFilter(Lorg/eclipse/jgit/revwalk/filter/RevFilter;)V

    .line 713
    return-void
.end method

.method private parseReachable(Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 2
    .parameter "id"

    .prologue
    .line 446
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    .line 447
    .local v0, o:Lorg/eclipse/jgit/revwalk/RevCommit;
    iget-object v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->REACHABLE:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevCommit;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 448
    iget-object v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->REACHABLE:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevCommit;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 449
    iget-object v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->reachableCommits:Lorg/eclipse/jgit/revwalk/RevCommitList;

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/revwalk/RevCommitList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 454
    .end local v0           #o:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_0
    :goto_0
    return-void

    .line 451
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private receivePack(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/io/OutputStream;)V
    .locals 5
    .parameter "monitor"
    .parameter "outputStream"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 750
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->onReceivePack()V

    .line 751
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->in:Ljava/io/InputStream;

    .line 752
    .local v0, input:Ljava/io/InputStream;
    iget-boolean v4, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->sideband:Z

    if-eqz v4, :cond_0

    .line 753
    new-instance v1, Lorg/eclipse/jgit/transport/SideBandInputStream;

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->getMessageWriter()Ljava/io/Writer;

    move-result-object v4

    invoke-direct {v1, v0, p1, v4, p2}, Lorg/eclipse/jgit/transport/SideBandInputStream;-><init>(Ljava/io/InputStream;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/io/Writer;Ljava/io/OutputStream;)V

    .end local v0           #input:Ljava/io/InputStream;
    .local v1, input:Ljava/io/InputStream;
    move-object v0, v1

    .line 756
    .end local v1           #input:Ljava/io/InputStream;
    .restart local v0       #input:Ljava/io/InputStream;
    :cond_0
    iget-object v4, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->local:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/Repository;->newObjectInserter()Lorg/eclipse/jgit/lib/ObjectInserter;

    move-result-object v2

    .line 758
    .local v2, ins:Lorg/eclipse/jgit/lib/ObjectInserter;
    :try_start_0
    invoke-virtual {v2, v0}, Lorg/eclipse/jgit/lib/ObjectInserter;->newPackParser(Ljava/io/InputStream;)Lorg/eclipse/jgit/transport/PackParser;

    move-result-object v3

    .line 759
    .local v3, parser:Lorg/eclipse/jgit/transport/PackParser;
    iget-boolean v4, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->thinPack:Z

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/transport/PackParser;->setAllowThin(Z)V

    .line 760
    iget-object v4, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->transport:Lorg/eclipse/jgit/transport/Transport;

    invoke-virtual {v4}, Lorg/eclipse/jgit/transport/Transport;->isCheckFetchedObjects()Z

    move-result v4

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/transport/PackParser;->setObjectChecking(Z)V

    .line 761
    iget-object v4, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->lockMessage:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/transport/PackParser;->setLockMessage(Ljava/lang/String;)V

    .line 762
    invoke-virtual {v3, p1}, Lorg/eclipse/jgit/transport/PackParser;->parse(Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/internal/storage/file/PackLock;

    move-result-object v4

    iput-object v4, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->packLock:Lorg/eclipse/jgit/internal/storage/file/PackLock;

    .line 763
    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/ObjectInserter;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 765
    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/ObjectInserter;->release()V

    .line 767
    return-void

    .line 765
    .end local v3           #parser:Lorg/eclipse/jgit/transport/PackParser;
    :catchall_0
    move-exception v4

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/ObjectInserter;->release()V

    throw v4
.end method

.method private sendWants(Ljava/util/Collection;)Z
    .locals 8
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;)Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p1, want:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/Ref;>;"
    const/4 v5, 0x0

    .line 457
    iget-boolean v6, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->statelessRPC:Z

    if-eqz v6, :cond_2

    iget-object v3, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->pckState:Lorg/eclipse/jgit/transport/PacketLineOut;

    .line 458
    .local v3, p:Lorg/eclipse/jgit/transport/PacketLineOut;
    :goto_0
    const/4 v0, 0x1

    .line 459
    .local v0, first:Z
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/lib/Ref;

    .line 461
    .local v4, r:Lorg/eclipse/jgit/lib/Ref;
    :try_start_0
    iget-object v6, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-interface {v4}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v6

    iget-object v7, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->REACHABLE:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/revwalk/RevObject;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    if-nez v6, :cond_0

    .line 472
    :goto_2
    new-instance v2, Ljava/lang/StringBuilder;

    const/16 v6, 0x2e

    invoke-direct {v2, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 473
    .local v2, line:Ljava/lang/StringBuilder;
    const-string v6, "want "

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 474
    invoke-interface {v4}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 475
    if-eqz v0, :cond_1

    .line 476
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->enableCapabilities()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 477
    const/4 v0, 0x0

    .line 479
    :cond_1
    const/16 v6, 0xa

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 480
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Lorg/eclipse/jgit/transport/PacketLineOut;->writeString(Ljava/lang/String;)V

    goto :goto_1

    .line 457
    .end local v0           #first:Z
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v2           #line:Ljava/lang/StringBuilder;
    .end local v3           #p:Lorg/eclipse/jgit/transport/PacketLineOut;
    .end local v4           #r:Lorg/eclipse/jgit/lib/Ref;
    :cond_2
    iget-object v3, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    goto :goto_0

    .line 482
    .restart local v0       #first:Z
    .restart local v1       #i$:Ljava/util/Iterator;
    .restart local v3       #p:Lorg/eclipse/jgit/transport/PacketLineOut;
    :cond_3
    if-eqz v0, :cond_4

    .line 486
    :goto_3
    return v5

    .line 484
    :cond_4
    invoke-virtual {v3}, Lorg/eclipse/jgit/transport/PacketLineOut;->end()V

    .line 485
    iput-boolean v5, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->outNeedsEnd:Z

    .line 486
    const/4 v5, 0x1

    goto :goto_3

    .line 467
    .restart local v4       #r:Lorg/eclipse/jgit/lib/Ref;
    :catch_0
    move-exception v6

    goto :goto_2
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    .line 379
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    if-eqz v0, :cond_0

    .line 380
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    .line 381
    :cond_0
    invoke-super {p0}, Lorg/eclipse/jgit/transport/BasePackConnection;->close()V

    .line 382
    return-void
.end method

.method public didFetchIncludeTags()Z
    .locals 1

    .prologue
    .line 305
    const/4 v0, 0x0

    return v0
.end method

.method public didFetchTestConnectivity()Z
    .locals 1

    .prologue
    .line 309
    const/4 v0, 0x0

    return v0
.end method

.method protected doFetch(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Collection;Ljava/util/Set;Ljava/io/OutputStream;)V
    .locals 4
    .parameter "monitor"
    .parameter
    .parameter
    .parameter "outputStream"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;",
            "Ljava/io/OutputStream;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 345
    .local p2, want:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/Ref;>;"
    .local p3, have:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    :try_start_0
    sget-object v2, Lorg/eclipse/jgit/lib/NullProgressMonitor;->INSTANCE:Lorg/eclipse/jgit/lib/NullProgressMonitor;

    if-ne p1, v2, :cond_2

    const/4 v2, 0x1

    :goto_0
    iput-boolean v2, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->noProgress:Z

    .line 347
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->markRefsAdvertised()V

    .line 348
    invoke-direct {p0, p2}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->maxTimeWanted(Ljava/util/Collection;)I

    move-result v2

    invoke-direct {p0, p3, v2}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->markReachable(Ljava/util/Set;I)V

    .line 350
    iget-boolean v2, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->statelessRPC:Z

    if-eqz v2, :cond_0

    .line 351
    new-instance v2, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;

    const v3, 0x7fffffff

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;-><init>(I)V

    iput-object v2, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->state:Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;

    .line 352
    new-instance v2, Lorg/eclipse/jgit/transport/PacketLineOut;

    iget-object v3, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->state:Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/transport/PacketLineOut;-><init>(Ljava/io/OutputStream;)V

    iput-object v2, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->pckState:Lorg/eclipse/jgit/transport/PacketLineOut;

    .line 355
    :cond_0
    invoke-direct {p0, p2}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->sendWants(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 356
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->negotiate(Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 358
    iget-object v2, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->dispose()V

    .line 359
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->reachableCommits:Lorg/eclipse/jgit/revwalk/RevCommitList;

    .line 360
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->state:Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;

    .line 361
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->pckState:Lorg/eclipse/jgit/transport/PacketLineOut;

    .line 363
    invoke-direct {p0, p1, p4}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->receivePack(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/io/OutputStream;)V
    :try_end_0
    .catch Lorg/eclipse/jgit/transport/BasePackFetchConnection$CancelledException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_2

    .line 375
    :cond_1
    :goto_1
    return-void

    .line 345
    :cond_2
    const/4 v2, 0x0

    goto :goto_0

    .line 365
    :catch_0
    move-exception v0

    .line 366
    .local v0, ce:Lorg/eclipse/jgit/transport/BasePackFetchConnection$CancelledException;
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->close()V

    goto :goto_1

    .line 368
    .end local v0           #ce:Lorg/eclipse/jgit/transport/BasePackFetchConnection$CancelledException;
    :catch_1
    move-exception v1

    .line 369
    .local v1, err:Ljava/io/IOException;
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->close()V

    .line 370
    new-instance v2, Lorg/eclipse/jgit/errors/TransportException;

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 371
    .end local v1           #err:Ljava/io/IOException;
    :catch_2
    move-exception v1

    .line 372
    .local v1, err:Ljava/lang/RuntimeException;
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->close()V

    .line 373
    new-instance v2, Lorg/eclipse/jgit/errors/TransportException;

    invoke-virtual {v1}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public final fetch(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Collection;Ljava/util/Set;)V
    .locals 1
    .parameter "monitor"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 291
    .local p2, want:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/Ref;>;"
    .local p3, have:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->fetch(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Collection;Ljava/util/Set;Ljava/io/OutputStream;)V

    .line 292
    return-void
.end method

.method public final fetch(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Collection;Ljava/util/Set;Ljava/io/OutputStream;)V
    .locals 0
    .parameter "monitor"
    .parameter
    .parameter
    .parameter "outputStream"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;",
            "Ljava/io/OutputStream;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 300
    .local p2, want:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/Ref;>;"
    .local p3, have:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->markStartedOperation()V

    .line 301
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->doFetch(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Collection;Ljava/util/Set;Ljava/io/OutputStream;)V

    .line 302
    return-void
.end method

.method public getPackLocks()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/PackLock;",
            ">;"
        }
    .end annotation

    .prologue
    .line 317
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->packLock:Lorg/eclipse/jgit/internal/storage/file/PackLock;

    if-eqz v0, :cond_0

    .line 318
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->packLock:Lorg/eclipse/jgit/internal/storage/file/PackLock;

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    .line 319
    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method protected onReceivePack()V
    .locals 0

    .prologue
    .line 778
    return-void
.end method

.method public setPackLockMessage(Ljava/lang/String;)V
    .locals 0
    .parameter "message"

    .prologue
    .line 313
    iput-object p1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->lockMessage:Ljava/lang/String;

    .line 314
    return-void
.end method
