.class public abstract Lorg/eclipse/jgit/transport/BaseReceivePack;
.super Ljava/lang/Object;
.source "BaseReceivePack.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/transport/BaseReceivePack$2;,
        Lorg/eclipse/jgit/transport/BaseReceivePack$FirstLine;,
        Lorg/eclipse/jgit/transport/BaseReceivePack$MessageOutputWrapper;,
        Lorg/eclipse/jgit/transport/BaseReceivePack$ReceiveConfig;,
        Lorg/eclipse/jgit/transport/BaseReceivePack$Reporter;
    }
.end annotation


# instance fields
.field private advertiseError:Ljava/lang/StringBuilder;

.field private advertiseRefsHook:Lorg/eclipse/jgit/transport/AdvertiseRefsHook;

.field private advertisedHaves:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation
.end field

.field private allowCreates:Z

.field private allowDeletes:Z

.field private allowNonFastForwards:Z

.field private allowOfsDelta:Z

.field private biDirectionalPipe:Z

.field private checkReferencedIsReachable:Z

.field private commands:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/ReceiveCommand;",
            ">;"
        }
    .end annotation
.end field

.field private final db:Lorg/eclipse/jgit/lib/Repository;

.field private enabledCapabilities:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private expectDataAfterPackFooter:Z

.field private maxObjectSizeLimit:J

.field private maxPackSizeLimit:J

.field protected msgOut:Ljava/io/OutputStream;

.field private final msgOutWrapper:Lorg/eclipse/jgit/transport/BaseReceivePack$MessageOutputWrapper;

.field private objectChecker:Lorg/eclipse/jgit/lib/ObjectChecker;

.field private origOut:Ljava/io/OutputStream;

.field private packLock:Lorg/eclipse/jgit/internal/storage/file/PackLock;

.field private packSize:Ljava/lang/Long;

.field private parser:Lorg/eclipse/jgit/transport/PackParser;

.field protected pckIn:Lorg/eclipse/jgit/transport/PacketLineIn;

.field protected pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

.field protected rawIn:Ljava/io/InputStream;

.field protected rawOut:Ljava/io/OutputStream;

.field private refFilter:Lorg/eclipse/jgit/transport/RefFilter;

.field private refLogIdent:Lorg/eclipse/jgit/lib/PersonIdent;

.field private refs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation
.end field

.field private sideBand:Z

.field private timeout:I

.field private timeoutIn:Lorg/eclipse/jgit/util/io/TimeoutInputStream;

.field private timer:Lorg/eclipse/jgit/util/io/InterruptTimer;

.field private final walk:Lorg/eclipse/jgit/revwalk/RevWalk;


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 3
    .parameter "into"

    .prologue
    .line 253
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 158
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->biDirectionalPipe:Z

    .line 213
    new-instance v1, Lorg/eclipse/jgit/transport/BaseReceivePack$MessageOutputWrapper;

    invoke-direct {v1, p0}, Lorg/eclipse/jgit/transport/BaseReceivePack$MessageOutputWrapper;-><init>(Lorg/eclipse/jgit/transport/BaseReceivePack;)V

    iput-object v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->msgOutWrapper:Lorg/eclipse/jgit/transport/BaseReceivePack$MessageOutputWrapper;

    .line 242
    const-wide/16 v1, -0x1

    iput-wide v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->maxPackSizeLimit:J

    .line 254
    iput-object p1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->db:Lorg/eclipse/jgit/lib/Repository;

    .line 255
    new-instance v1, Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    iput-object v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    .line 257
    iget-object v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v1

    sget-object v2, Lorg/eclipse/jgit/transport/BaseReceivePack$ReceiveConfig;->KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/StoredConfig;->get(Lorg/eclipse/jgit/lib/Config$SectionParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/transport/BaseReceivePack$ReceiveConfig;

    .line 258
    .local v0, cfg:Lorg/eclipse/jgit/transport/BaseReceivePack$ReceiveConfig;
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/BaseReceivePack$ReceiveConfig;->newObjectChecker()Lorg/eclipse/jgit/lib/ObjectChecker;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->objectChecker:Lorg/eclipse/jgit/lib/ObjectChecker;

    .line 259
    iget-boolean v1, v0, Lorg/eclipse/jgit/transport/BaseReceivePack$ReceiveConfig;->allowCreates:Z

    iput-boolean v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->allowCreates:Z

    .line 260
    iget-boolean v1, v0, Lorg/eclipse/jgit/transport/BaseReceivePack$ReceiveConfig;->allowDeletes:Z

    iput-boolean v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->allowDeletes:Z

    .line 261
    iget-boolean v1, v0, Lorg/eclipse/jgit/transport/BaseReceivePack$ReceiveConfig;->allowNonFastForwards:Z

    iput-boolean v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->allowNonFastForwards:Z

    .line 262
    iget-boolean v1, v0, Lorg/eclipse/jgit/transport/BaseReceivePack$ReceiveConfig;->allowOfsDelta:Z

    iput-boolean v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->allowOfsDelta:Z

    .line 263
    sget-object v1, Lorg/eclipse/jgit/transport/AdvertiseRefsHook;->DEFAULT:Lorg/eclipse/jgit/transport/AdvertiseRefsHook;

    iput-object v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->advertiseRefsHook:Lorg/eclipse/jgit/transport/AdvertiseRefsHook;

    .line 264
    sget-object v1, Lorg/eclipse/jgit/transport/RefFilter;->DEFAULT:Lorg/eclipse/jgit/transport/RefFilter;

    iput-object v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->refFilter:Lorg/eclipse/jgit/transport/RefFilter;

    .line 265
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->advertisedHaves:Ljava/util/Set;

    .line 266
    return-void
.end method

.method private checkConnectivity()V
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1037
    const/4 v0, 0x0

    .line 1038
    .local v0, baseObjects:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;,"Lorg/eclipse/jgit/lib/ObjectIdSubclassMap<Lorg/eclipse/jgit/lib/ObjectId;>;"
    const/4 v10, 0x0

    .line 1039
    .local v10, providedObjects:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;,"Lorg/eclipse/jgit/lib/ObjectIdSubclassMap<Lorg/eclipse/jgit/lib/ObjectId;>;"
    sget-object v2, Lorg/eclipse/jgit/lib/NullProgressMonitor;->INSTANCE:Lorg/eclipse/jgit/lib/NullProgressMonitor;

    .line 1040
    .local v2, checking:Lorg/eclipse/jgit/lib/ProgressMonitor;
    iget-boolean v11, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->sideBand:Z

    if-eqz v11, :cond_0

    .line 1041
    new-instance v7, Lorg/eclipse/jgit/transport/SideBandProgressMonitor;

    iget-object v11, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->msgOut:Ljava/io/OutputStream;

    invoke-direct {v7, v11}, Lorg/eclipse/jgit/transport/SideBandProgressMonitor;-><init>(Ljava/io/OutputStream;)V

    .line 1042
    .local v7, m:Lorg/eclipse/jgit/transport/SideBandProgressMonitor;
    const-wide/16 v11, 0x2ee

    sget-object v13, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v7, v11, v12, v13}, Lorg/eclipse/jgit/transport/SideBandProgressMonitor;->setDelayStart(JLjava/util/concurrent/TimeUnit;)V

    .line 1043
    move-object v2, v7

    .line 1046
    .end local v7           #m:Lorg/eclipse/jgit/transport/SideBandProgressMonitor;
    :cond_0
    iget-boolean v11, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->checkReferencedIsReachable:Z

    if-eqz v11, :cond_1

    .line 1047
    iget-object v11, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->parser:Lorg/eclipse/jgit/transport/PackParser;

    invoke-virtual {v11}, Lorg/eclipse/jgit/transport/PackParser;->getBaseObjectIds()Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;

    move-result-object v0

    .line 1048
    iget-object v11, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->parser:Lorg/eclipse/jgit/transport/PackParser;

    invoke-virtual {v11}, Lorg/eclipse/jgit/transport/PackParser;->getNewObjectIds()Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;

    move-result-object v10

    .line 1050
    :cond_1
    const/4 v11, 0x0

    iput-object v11, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->parser:Lorg/eclipse/jgit/transport/PackParser;

    .line 1052
    new-instance v9, Lorg/eclipse/jgit/revwalk/ObjectWalk;

    iget-object v11, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v9, v11}, Lorg/eclipse/jgit/revwalk/ObjectWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 1053
    .local v9, ow:Lorg/eclipse/jgit/revwalk/ObjectWalk;
    const/4 v11, 0x0

    invoke-virtual {v9, v11}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->setRetainBody(Z)V

    .line 1054
    if-eqz v0, :cond_2

    .line 1055
    sget-object v11, Lorg/eclipse/jgit/revwalk/RevSort;->TOPO:Lorg/eclipse/jgit/revwalk/RevSort;

    invoke-virtual {v9, v11}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->sort(Lorg/eclipse/jgit/revwalk/RevSort;)V

    .line 1056
    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_2

    .line 1057
    sget-object v11, Lorg/eclipse/jgit/revwalk/RevSort;->BOUNDARY:Lorg/eclipse/jgit/revwalk/RevSort;

    const/4 v12, 0x1

    invoke-virtual {v9, v11, v12}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->sort(Lorg/eclipse/jgit/revwalk/RevSort;Z)V

    .line 1060
    :cond_2
    iget-object v11, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->commands:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, i$:Ljava/util/Iterator;
    :cond_3
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/transport/ReceiveCommand;

    .line 1061
    .local v3, cmd:Lorg/eclipse/jgit/transport/ReceiveCommand;
    invoke-virtual {v3}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getResult()Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    move-result-object v11

    sget-object v12, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->NOT_ATTEMPTED:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    if-ne v11, v12, :cond_3

    .line 1063
    invoke-virtual {v3}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getType()Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    move-result-object v11

    sget-object v12, Lorg/eclipse/jgit/transport/ReceiveCommand$Type;->DELETE:Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    if-eq v11, v12, :cond_3

    .line 1065
    invoke-virtual {v3}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getNewId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v11

    invoke-virtual {v9, v11}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v11

    invoke-virtual {v9, v11}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->markStart(Lorg/eclipse/jgit/revwalk/RevObject;)V

    goto :goto_0

    .line 1067
    .end local v3           #cmd:Lorg/eclipse/jgit/transport/ReceiveCommand;
    :cond_4
    iget-object v11, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->advertisedHaves:Ljava/util/Set;

    invoke-interface {v11}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_5
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_7

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/lib/ObjectId;

    .line 1068
    .local v4, have:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-virtual {v9, v4}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v8

    .line 1069
    .local v8, o:Lorg/eclipse/jgit/revwalk/RevObject;
    invoke-virtual {v9, v8}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->markUninteresting(Lorg/eclipse/jgit/revwalk/RevObject;)V

    .line 1071
    if-eqz v0, :cond_5

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_5

    .line 1072
    invoke-virtual {v9, v8}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->peel(Lorg/eclipse/jgit/revwalk/RevObject;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v8

    .line 1073
    instance-of v11, v8, Lorg/eclipse/jgit/revwalk/RevCommit;

    if-eqz v11, :cond_6

    .line 1074
    check-cast v8, Lorg/eclipse/jgit/revwalk/RevCommit;

    .end local v8           #o:Lorg/eclipse/jgit/revwalk/RevObject;
    invoke-virtual {v8}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v8

    .line 1075
    .restart local v8       #o:Lorg/eclipse/jgit/revwalk/RevObject;
    :cond_6
    instance-of v11, v8, Lorg/eclipse/jgit/revwalk/RevTree;

    if-eqz v11, :cond_5

    .line 1076
    invoke-virtual {v9, v8}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->markUninteresting(Lorg/eclipse/jgit/revwalk/RevObject;)V

    goto :goto_1

    .line 1080
    .end local v4           #have:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v8           #o:Lorg/eclipse/jgit/revwalk/RevObject;
    :cond_7
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v11

    iget-object v11, v11, Lorg/eclipse/jgit/internal/JGitText;->countingObjects:Ljava/lang/String;

    const/4 v12, 0x0

    invoke-interface {v2, v11, v12}, Lorg/eclipse/jgit/lib/ProgressMonitor;->beginTask(Ljava/lang/String;I)V

    .line 1082
    :cond_8
    invoke-virtual {v9}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v1

    .local v1, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-eqz v1, :cond_9

    .line 1083
    const/4 v11, 0x1

    invoke-interface {v2, v11}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    .line 1084
    if-eqz v10, :cond_8

    sget-object v11, Lorg/eclipse/jgit/revwalk/RevFlag;->UNINTERESTING:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v1, v11}, Lorg/eclipse/jgit/revwalk/RevCommit;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v11

    if-nez v11, :cond_8

    invoke-virtual {v10, v1}, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->contains(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v11

    if-nez v11, :cond_8

    .line 1087
    new-instance v11, Lorg/eclipse/jgit/errors/MissingObjectException;

    const-string v12, "commit"

    invoke-direct {v11, v1, v12}, Lorg/eclipse/jgit/errors/MissingObjectException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V

    throw v11

    .line 1091
    :cond_9
    invoke-virtual {v9}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->nextObject()Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v8

    .restart local v8       #o:Lorg/eclipse/jgit/revwalk/RevObject;
    if-eqz v8, :cond_b

    .line 1092
    const/4 v11, 0x1

    invoke-interface {v2, v11}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    .line 1093
    sget-object v11, Lorg/eclipse/jgit/revwalk/RevFlag;->UNINTERESTING:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v8, v11}, Lorg/eclipse/jgit/revwalk/RevObject;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v11

    if-nez v11, :cond_9

    .line 1096
    if-eqz v10, :cond_a

    .line 1097
    invoke-virtual {v10, v8}, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->contains(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v11

    if-nez v11, :cond_9

    .line 1100
    new-instance v11, Lorg/eclipse/jgit/errors/MissingObjectException;

    invoke-virtual {v8}, Lorg/eclipse/jgit/revwalk/RevObject;->getType()I

    move-result v12

    invoke-direct {v11, v8, v12}, Lorg/eclipse/jgit/errors/MissingObjectException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;I)V

    throw v11

    .line 1103
    :cond_a
    instance-of v11, v8, Lorg/eclipse/jgit/revwalk/RevBlob;

    if-eqz v11, :cond_9

    iget-object v11, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v11, v8}, Lorg/eclipse/jgit/lib/Repository;->hasObject(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v11

    if-nez v11, :cond_9

    .line 1104
    new-instance v11, Lorg/eclipse/jgit/errors/MissingObjectException;

    const-string v12, "blob"

    invoke-direct {v11, v8, v12}, Lorg/eclipse/jgit/errors/MissingObjectException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V

    throw v11

    .line 1106
    :cond_b
    invoke-interface {v2}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    .line 1108
    if-eqz v0, :cond_d

    .line 1109
    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_c
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_d

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/eclipse/jgit/lib/ObjectId;

    .line 1110
    .local v6, id:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-virtual {v9, v6}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v8

    .line 1111
    sget-object v11, Lorg/eclipse/jgit/revwalk/RevFlag;->UNINTERESTING:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v8, v11}, Lorg/eclipse/jgit/revwalk/RevObject;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v11

    if-nez v11, :cond_c

    .line 1112
    new-instance v11, Lorg/eclipse/jgit/errors/MissingObjectException;

    invoke-virtual {v8}, Lorg/eclipse/jgit/revwalk/RevObject;->getType()I

    move-result v12

    invoke-direct {v11, v8, v12}, Lorg/eclipse/jgit/errors/MissingObjectException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;I)V

    throw v11

    .line 1115
    .end local v6           #id:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_d
    return-void
.end method

.method private needCheckConnectivity()Z
    .locals 1

    .prologue
    .line 1032
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BaseReceivePack;->isCheckReceivedObjects()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BaseReceivePack;->isCheckReferencedObjectsAreReachable()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private receivePack()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 996
    iget-object v5, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->timeoutIn:Lorg/eclipse/jgit/util/io/TimeoutInputStream;

    if-eqz v5, :cond_0

    .line 997
    iget-object v5, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->timeoutIn:Lorg/eclipse/jgit/util/io/TimeoutInputStream;

    iget v6, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->timeout:I

    mul-int/lit8 v6, v6, 0xa

    mul-int/lit16 v6, v6, 0x3e8

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/util/io/TimeoutInputStream;->setTimeout(I)V

    .line 999
    :cond_0
    sget-object v2, Lorg/eclipse/jgit/lib/NullProgressMonitor;->INSTANCE:Lorg/eclipse/jgit/lib/NullProgressMonitor;

    .line 1000
    .local v2, receiving:Lorg/eclipse/jgit/lib/ProgressMonitor;
    sget-object v3, Lorg/eclipse/jgit/lib/NullProgressMonitor;->INSTANCE:Lorg/eclipse/jgit/lib/NullProgressMonitor;

    .line 1001
    .local v3, resolving:Lorg/eclipse/jgit/lib/ProgressMonitor;
    iget-boolean v5, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->sideBand:Z

    if-eqz v5, :cond_1

    .line 1002
    new-instance v3, Lorg/eclipse/jgit/transport/SideBandProgressMonitor;

    .end local v3           #resolving:Lorg/eclipse/jgit/lib/ProgressMonitor;
    iget-object v5, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->msgOut:Ljava/io/OutputStream;

    invoke-direct {v3, v5}, Lorg/eclipse/jgit/transport/SideBandProgressMonitor;-><init>(Ljava/io/OutputStream;)V

    .line 1004
    .restart local v3       #resolving:Lorg/eclipse/jgit/lib/ProgressMonitor;
    :cond_1
    iget-object v5, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v5}, Lorg/eclipse/jgit/lib/Repository;->newObjectInserter()Lorg/eclipse/jgit/lib/ObjectInserter;

    move-result-object v0

    .line 1006
    .local v0, ins:Lorg/eclipse/jgit/lib/ObjectInserter;
    :try_start_0
    const-string v1, "jgit receive-pack"

    .line 1007
    .local v1, lockMsg:Ljava/lang/String;
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BaseReceivePack;->getRefLogIdent()Lorg/eclipse/jgit/lib/PersonIdent;

    move-result-object v5

    if-eqz v5, :cond_2

    .line 1008
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " from "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BaseReceivePack;->getRefLogIdent()Lorg/eclipse/jgit/lib/PersonIdent;

    move-result-object v6

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/PersonIdent;->toExternalString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1010
    :cond_2
    iget-object v5, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->rawIn:Ljava/io/InputStream;

    invoke-virtual {v0, v5}, Lorg/eclipse/jgit/lib/ObjectInserter;->newPackParser(Ljava/io/InputStream;)Lorg/eclipse/jgit/transport/PackParser;

    move-result-object v5

    iput-object v5, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->parser:Lorg/eclipse/jgit/transport/PackParser;

    .line 1011
    iget-object v5, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->parser:Lorg/eclipse/jgit/transport/PackParser;

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/transport/PackParser;->setAllowThin(Z)V

    .line 1012
    iget-object v5, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->parser:Lorg/eclipse/jgit/transport/PackParser;

    iget-boolean v6, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->checkReferencedIsReachable:Z

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/transport/PackParser;->setNeedNewObjectIds(Z)V

    .line 1013
    iget-object v5, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->parser:Lorg/eclipse/jgit/transport/PackParser;

    iget-boolean v6, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->checkReferencedIsReachable:Z

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/transport/PackParser;->setNeedBaseObjectIds(Z)V

    .line 1014
    iget-object v5, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->parser:Lorg/eclipse/jgit/transport/PackParser;

    iget-boolean v6, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->biDirectionalPipe:Z

    if-nez v6, :cond_4

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BaseReceivePack;->isExpectDataAfterPackFooter()Z

    move-result v6

    if-nez v6, :cond_4

    :goto_0
    invoke-virtual {v5, v4}, Lorg/eclipse/jgit/transport/PackParser;->setCheckEofAfterPackFooter(Z)V

    .line 1016
    iget-object v4, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->parser:Lorg/eclipse/jgit/transport/PackParser;

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BaseReceivePack;->isExpectDataAfterPackFooter()Z

    move-result v5

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/transport/PackParser;->setExpectDataAfterPackFooter(Z)V

    .line 1017
    iget-object v4, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->parser:Lorg/eclipse/jgit/transport/PackParser;

    iget-object v5, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->objectChecker:Lorg/eclipse/jgit/lib/ObjectChecker;

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/transport/PackParser;->setObjectChecker(Lorg/eclipse/jgit/lib/ObjectChecker;)V

    .line 1018
    iget-object v4, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->parser:Lorg/eclipse/jgit/transport/PackParser;

    invoke-virtual {v4, v1}, Lorg/eclipse/jgit/transport/PackParser;->setLockMessage(Ljava/lang/String;)V

    .line 1019
    iget-object v4, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->parser:Lorg/eclipse/jgit/transport/PackParser;

    iget-wide v5, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->maxObjectSizeLimit:J

    invoke-virtual {v4, v5, v6}, Lorg/eclipse/jgit/transport/PackParser;->setMaxObjectSizeLimit(J)V

    .line 1020
    iget-object v4, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->parser:Lorg/eclipse/jgit/transport/PackParser;

    invoke-virtual {v4, v2, v3}, Lorg/eclipse/jgit/transport/PackParser;->parse(Lorg/eclipse/jgit/lib/ProgressMonitor;Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/internal/storage/file/PackLock;

    move-result-object v4

    iput-object v4, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->packLock:Lorg/eclipse/jgit/internal/storage/file/PackLock;

    .line 1021
    iget-object v4, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->parser:Lorg/eclipse/jgit/transport/PackParser;

    invoke-virtual {v4}, Lorg/eclipse/jgit/transport/PackParser;->getPackSize()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    iput-object v4, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->packSize:Ljava/lang/Long;

    .line 1022
    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectInserter;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1024
    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectInserter;->release()V

    .line 1027
    iget-object v4, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->timeoutIn:Lorg/eclipse/jgit/util/io/TimeoutInputStream;

    if-eqz v4, :cond_3

    .line 1028
    iget-object v4, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->timeoutIn:Lorg/eclipse/jgit/util/io/TimeoutInputStream;

    iget v5, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->timeout:I

    mul-int/lit16 v5, v5, 0x3e8

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/util/io/TimeoutInputStream;->setTimeout(I)V

    .line 1029
    :cond_3
    return-void

    .line 1014
    :cond_4
    const/4 v4, 0x0

    goto :goto_0

    .line 1024
    .end local v1           #lockMsg:Ljava/lang/String;
    :catchall_0
    move-exception v4

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectInserter;->release()V

    throw v4
.end method


# virtual methods
.method protected close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1373
    iget-boolean v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->sideBand:Z

    if-eqz v1, :cond_0

    .line 1380
    iget-object v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->msgOut:Ljava/io/OutputStream;

    check-cast v1, Lorg/eclipse/jgit/transport/SideBandOutputStream;

    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/SideBandOutputStream;->flushBuffer()V

    .line 1381
    iget-object v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->rawOut:Ljava/io/OutputStream;

    check-cast v1, Lorg/eclipse/jgit/transport/SideBandOutputStream;

    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/SideBandOutputStream;->flushBuffer()V

    .line 1383
    new-instance v0, Lorg/eclipse/jgit/transport/PacketLineOut;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->origOut:Ljava/io/OutputStream;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/transport/PacketLineOut;-><init>(Ljava/io/OutputStream;)V

    .line 1384
    .local v0, plo:Lorg/eclipse/jgit/transport/PacketLineOut;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/transport/PacketLineOut;->setFlushOnEnd(Z)V

    .line 1385
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/PacketLineOut;->end()V

    .line 1388
    .end local v0           #plo:Lorg/eclipse/jgit/transport/PacketLineOut;
    :cond_0
    iget-boolean v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->biDirectionalPipe:Z

    if-eqz v1, :cond_2

    .line 1393
    iget-boolean v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->sideBand:Z

    if-nez v1, :cond_1

    iget-object v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->msgOut:Ljava/io/OutputStream;

    if-eqz v1, :cond_1

    .line 1394
    iget-object v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->msgOut:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V

    .line 1395
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->rawOut:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V

    .line 1397
    :cond_2
    return-void
.end method

.method protected enableCapabilities()V
    .locals 4

    .prologue
    const v3, 0xfff0

    .line 953
    const-string v1, "side-band-64k"

    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/transport/BaseReceivePack;->isCapabilityEnabled(Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->sideBand:Z

    .line 954
    iget-boolean v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->sideBand:Z

    if-eqz v1, :cond_0

    .line 955
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->rawOut:Ljava/io/OutputStream;

    .line 957
    .local v0, out:Ljava/io/OutputStream;
    new-instance v1, Lorg/eclipse/jgit/transport/SideBandOutputStream;

    const/4 v2, 0x1

    invoke-direct {v1, v2, v3, v0}, Lorg/eclipse/jgit/transport/SideBandOutputStream;-><init>(IILjava/io/OutputStream;)V

    iput-object v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->rawOut:Ljava/io/OutputStream;

    .line 958
    new-instance v1, Lorg/eclipse/jgit/transport/SideBandOutputStream;

    const/4 v2, 0x2

    invoke-direct {v1, v2, v3, v0}, Lorg/eclipse/jgit/transport/SideBandOutputStream;-><init>(IILjava/io/OutputStream;)V

    iput-object v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->msgOut:Ljava/io/OutputStream;

    .line 960
    new-instance v1, Lorg/eclipse/jgit/transport/PacketLineOut;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->rawOut:Ljava/io/OutputStream;

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/transport/PacketLineOut;-><init>(Ljava/io/OutputStream;)V

    iput-object v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    .line 961
    iget-object v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/transport/PacketLineOut;->setFlushOnEnd(Z)V

    .line 963
    .end local v0           #out:Ljava/io/OutputStream;
    :cond_0
    return-void
.end method

.method protected executeCommands()V
    .locals 10

    .prologue
    .line 1249
    sget-object v7, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->NOT_ATTEMPTED:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    invoke-virtual {p0, v7}, Lorg/eclipse/jgit/transport/BaseReceivePack;->filterCommands(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;)Ljava/util/List;

    move-result-object v5

    .line 1250
    .local v5, toApply:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/ReceiveCommand;>;"
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 1273
    :cond_0
    :goto_0
    return-void

    .line 1253
    :cond_1
    sget-object v6, Lorg/eclipse/jgit/lib/NullProgressMonitor;->INSTANCE:Lorg/eclipse/jgit/lib/NullProgressMonitor;

    .line 1254
    .local v6, updating:Lorg/eclipse/jgit/lib/ProgressMonitor;
    iget-boolean v7, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->sideBand:Z

    if-eqz v7, :cond_2

    .line 1255
    new-instance v4, Lorg/eclipse/jgit/transport/SideBandProgressMonitor;

    iget-object v7, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->msgOut:Ljava/io/OutputStream;

    invoke-direct {v4, v7}, Lorg/eclipse/jgit/transport/SideBandProgressMonitor;-><init>(Ljava/io/OutputStream;)V

    .line 1256
    .local v4, pm:Lorg/eclipse/jgit/transport/SideBandProgressMonitor;
    const-wide/16 v7, 0xfa

    sget-object v9, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v4, v7, v8, v9}, Lorg/eclipse/jgit/transport/SideBandProgressMonitor;->setDelayStart(JLjava/util/concurrent/TimeUnit;)V

    .line 1257
    move-object v6, v4

    .line 1260
    .end local v4           #pm:Lorg/eclipse/jgit/transport/SideBandProgressMonitor;
    :cond_2
    iget-object v7, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v7}, Lorg/eclipse/jgit/lib/Repository;->getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;

    move-result-object v7

    invoke-virtual {v7}, Lorg/eclipse/jgit/lib/RefDatabase;->newBatchUpdate()Lorg/eclipse/jgit/lib/BatchRefUpdate;

    move-result-object v0

    .line 1261
    .local v0, batch:Lorg/eclipse/jgit/lib/BatchRefUpdate;
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BaseReceivePack;->isAllowNonFastForwards()Z

    move-result v7

    invoke-virtual {v0, v7}, Lorg/eclipse/jgit/lib/BatchRefUpdate;->setAllowNonFastForwards(Z)Lorg/eclipse/jgit/lib/BatchRefUpdate;

    .line 1262
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BaseReceivePack;->getRefLogIdent()Lorg/eclipse/jgit/lib/PersonIdent;

    move-result-object v7

    invoke-virtual {v0, v7}, Lorg/eclipse/jgit/lib/BatchRefUpdate;->setRefLogIdent(Lorg/eclipse/jgit/lib/PersonIdent;)Lorg/eclipse/jgit/lib/BatchRefUpdate;

    .line 1263
    const-string v7, "push"

    const/4 v8, 0x1

    invoke-virtual {v0, v7, v8}, Lorg/eclipse/jgit/lib/BatchRefUpdate;->setRefLogMessage(Ljava/lang/String;Z)Lorg/eclipse/jgit/lib/BatchRefUpdate;

    .line 1264
    invoke-virtual {v0, v5}, Lorg/eclipse/jgit/lib/BatchRefUpdate;->addCommand(Ljava/util/Collection;)Lorg/eclipse/jgit/lib/BatchRefUpdate;

    .line 1266
    :try_start_0
    iget-object v7, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v0, v7, v6}, Lorg/eclipse/jgit/lib/BatchRefUpdate;->execute(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1267
    :catch_0
    move-exception v2

    .line 1268
    .local v2, err:Ljava/io/IOException;
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_3
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/transport/ReceiveCommand;

    .line 1269
    .local v1, cmd:Lorg/eclipse/jgit/transport/ReceiveCommand;
    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getResult()Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    move-result-object v7

    sget-object v8, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->NOT_ATTEMPTED:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    if-ne v7, v8, :cond_3

    .line 1270
    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/transport/ReceiveCommand;->reject(Ljava/io/IOException;)V

    goto :goto_1
.end method

.method protected filterCommands(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;)Ljava/util/List;
    .locals 1
    .parameter "want"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/transport/ReceiveCommand$Result;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/ReceiveCommand;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1244
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->commands:Ljava/util/List;

    invoke-static {v0, p1}, Lorg/eclipse/jgit/transport/ReceiveCommand;->filter(Ljava/util/List;Lorg/eclipse/jgit/transport/ReceiveCommand$Result;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getAdvertiseRefsHook()Lorg/eclipse/jgit/transport/AdvertiseRefsHook;
    .locals 1

    .prologue
    .line 593
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->advertiseRefsHook:Lorg/eclipse/jgit/transport/AdvertiseRefsHook;

    return-object v0
.end method

.method public final getAdvertisedObjects()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation

    .prologue
    .line 426
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->advertisedHaves:Ljava/util/Set;

    return-object v0
.end method

.method protected getAdvertisedOrDefaultRefs()Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 836
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->refs:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 837
    invoke-virtual {p0, v1, v1}, Lorg/eclipse/jgit/transport/BaseReceivePack;->setAdvertisedRefs(Ljava/util/Map;Ljava/util/Set;)V

    .line 838
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->refs:Ljava/util/Map;

    return-object v0
.end method

.method public final getAdvertisedRefs()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation

    .prologue
    .line 381
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->refs:Ljava/util/Map;

    return-object v0
.end method

.method public getAllCommands()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/ReceiveCommand;",
            ">;"
        }
    .end annotation

    .prologue
    .line 702
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->commands:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected abstract getLockMessageProcessName()Ljava/lang/String;
.end method

.method public getMessageOutputStream()Ljava/io/OutputStream;
    .locals 1

    .prologue
    .line 754
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->msgOutWrapper:Lorg/eclipse/jgit/transport/BaseReceivePack$MessageOutputWrapper;

    return-object v0
.end method

.method public getPackSize()J
    .locals 2

    .prologue
    .line 768
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->packSize:Ljava/lang/Long;

    if-eqz v0, :cond_0

    .line 769
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->packSize:Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0

    .line 770
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->packSizeNotSetYet:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getRefFilter()Lorg/eclipse/jgit/transport/RefFilter;
    .locals 1

    .prologue
    .line 598
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->refFilter:Lorg/eclipse/jgit/transport/RefFilter;

    return-object v0
.end method

.method public getRefLogIdent()Lorg/eclipse/jgit/lib/PersonIdent;
    .locals 1

    .prologue
    .line 572
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->refLogIdent:Lorg/eclipse/jgit/lib/PersonIdent;

    return-object v0
.end method

.method public final getRepository()Lorg/eclipse/jgit/lib/Repository;
    .locals 1

    .prologue
    .line 366
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->db:Lorg/eclipse/jgit/lib/Repository;

    return-object v0
.end method

.method public final getRevWalk()Lorg/eclipse/jgit/revwalk/RevWalk;
    .locals 1

    .prologue
    .line 371
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    return-object v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 637
    iget v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->timeout:I

    return v0
.end method

.method protected hasCommands()Z
    .locals 1

    .prologue
    .line 775
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->commands:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected hasError()Z
    .locals 1

    .prologue
    .line 780
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->advertiseError:Ljava/lang/StringBuilder;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected init(Ljava/io/InputStream;Ljava/io/OutputStream;Ljava/io/OutputStream;)V
    .locals 6
    .parameter "input"
    .parameter "output"
    .parameter "messages"

    .prologue
    .line 802
    iput-object p2, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->origOut:Ljava/io/OutputStream;

    .line 803
    iput-object p1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->rawIn:Ljava/io/InputStream;

    .line 804
    iput-object p2, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->rawOut:Ljava/io/OutputStream;

    .line 805
    iput-object p3, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->msgOut:Ljava/io/OutputStream;

    .line 807
    iget v2, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->timeout:I

    if-lez v2, :cond_0

    .line 808
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    .line 809
    .local v0, caller:Ljava/lang/Thread;
    new-instance v2, Lorg/eclipse/jgit/util/io/InterruptTimer;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "-Timer"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/util/io/InterruptTimer;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->timer:Lorg/eclipse/jgit/util/io/InterruptTimer;

    .line 810
    new-instance v2, Lorg/eclipse/jgit/util/io/TimeoutInputStream;

    iget-object v3, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->rawIn:Ljava/io/InputStream;

    iget-object v4, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->timer:Lorg/eclipse/jgit/util/io/InterruptTimer;

    invoke-direct {v2, v3, v4}, Lorg/eclipse/jgit/util/io/TimeoutInputStream;-><init>(Ljava/io/InputStream;Lorg/eclipse/jgit/util/io/InterruptTimer;)V

    iput-object v2, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->timeoutIn:Lorg/eclipse/jgit/util/io/TimeoutInputStream;

    .line 811
    new-instance v1, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;

    iget-object v2, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->rawOut:Ljava/io/OutputStream;

    iget-object v3, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->timer:Lorg/eclipse/jgit/util/io/InterruptTimer;

    invoke-direct {v1, v2, v3}, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;-><init>(Ljava/io/OutputStream;Lorg/eclipse/jgit/util/io/InterruptTimer;)V

    .line 812
    .local v1, o:Lorg/eclipse/jgit/util/io/TimeoutOutputStream;
    iget-object v2, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->timeoutIn:Lorg/eclipse/jgit/util/io/TimeoutInputStream;

    iget v3, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->timeout:I

    mul-int/lit16 v3, v3, 0x3e8

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/util/io/TimeoutInputStream;->setTimeout(I)V

    .line 813
    iget v2, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->timeout:I

    mul-int/lit16 v2, v2, 0x3e8

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/util/io/TimeoutOutputStream;->setTimeout(I)V

    .line 814
    iget-object v2, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->timeoutIn:Lorg/eclipse/jgit/util/io/TimeoutInputStream;

    iput-object v2, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->rawIn:Ljava/io/InputStream;

    .line 815
    iput-object v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->rawOut:Ljava/io/OutputStream;

    .line 818
    .end local v0           #caller:Ljava/lang/Thread;
    .end local v1           #o:Lorg/eclipse/jgit/util/io/TimeoutOutputStream;
    :cond_0
    iget-wide v2, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->maxPackSizeLimit:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-ltz v2, :cond_1

    .line 819
    new-instance v2, Lorg/eclipse/jgit/transport/BaseReceivePack$1;

    iget-object v3, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->rawIn:Ljava/io/InputStream;

    iget-wide v4, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->maxPackSizeLimit:J

    invoke-direct {v2, p0, v3, v4, v5}, Lorg/eclipse/jgit/transport/BaseReceivePack$1;-><init>(Lorg/eclipse/jgit/transport/BaseReceivePack;Ljava/io/InputStream;J)V

    iput-object v2, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->rawIn:Ljava/io/InputStream;

    .line 826
    :cond_1
    new-instance v2, Lorg/eclipse/jgit/transport/PacketLineIn;

    iget-object v3, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->rawIn:Ljava/io/InputStream;

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/transport/PacketLineIn;-><init>(Ljava/io/InputStream;)V

    iput-object v2, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->pckIn:Lorg/eclipse/jgit/transport/PacketLineIn;

    .line 827
    new-instance v2, Lorg/eclipse/jgit/transport/PacketLineOut;

    iget-object v3, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->rawOut:Ljava/io/OutputStream;

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/transport/PacketLineOut;-><init>(Ljava/io/OutputStream;)V

    iput-object v2, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    .line 828
    iget-object v2, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/transport/PacketLineOut;->setFlushOnEnd(Z)V

    .line 830
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    iput-object v2, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->enabledCapabilities:Ljava/util/Set;

    .line 831
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->commands:Ljava/util/List;

    .line 832
    return-void
.end method

.method public isAllowCreates()Z
    .locals 1

    .prologue
    .line 529
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->allowCreates:Z

    return v0
.end method

.method public isAllowDeletes()Z
    .locals 1

    .prologue
    .line 542
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->allowDeletes:Z

    return v0
.end method

.method public isAllowNonFastForwards()Z
    .locals 1

    .prologue
    .line 558
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->allowNonFastForwards:Z

    return v0
.end method

.method public isBiDirectionalPipe()Z
    .locals 1

    .prologue
    .line 467
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->biDirectionalPipe:Z

    return v0
.end method

.method protected isCapabilityEnabled(Ljava/lang/String;)Z
    .locals 1
    .parameter "name"

    .prologue
    .line 973
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->enabledCapabilities:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isCheckReceivedObjects()Z
    .locals 1

    .prologue
    .line 502
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->objectChecker:Lorg/eclipse/jgit/lib/ObjectChecker;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isCheckReferencedObjectsAreReachable()Z
    .locals 1

    .prologue
    .line 435
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->checkReferencedIsReachable:Z

    return v0
.end method

.method public isExpectDataAfterPackFooter()Z
    .locals 1

    .prologue
    .line 485
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->expectDataAfterPackFooter:Z

    return v0
.end method

.method public isSideBand()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/transport/RequestNotYetReadException;
        }
    .end annotation

    .prologue
    .line 695
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->enabledCapabilities:Ljava/util/Set;

    if-nez v0, :cond_0

    .line 696
    new-instance v0, Lorg/eclipse/jgit/transport/RequestNotYetReadException;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/RequestNotYetReadException;-><init>()V

    throw v0

    .line 697
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->enabledCapabilities:Ljava/util/Set;

    const-string v1, "side-band-64k"

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected needPack()Z
    .locals 4

    .prologue
    .line 978
    iget-object v2, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->commands:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/transport/ReceiveCommand;

    .line 979
    .local v0, cmd:Lorg/eclipse/jgit/transport/ReceiveCommand;
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getType()Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    move-result-object v2

    sget-object v3, Lorg/eclipse/jgit/transport/ReceiveCommand$Type;->DELETE:Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    if-eq v2, v3, :cond_0

    .line 980
    const/4 v2, 0x1

    .line 982
    .end local v0           #cmd:Lorg/eclipse/jgit/transport/ReceiveCommand;
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method protected receivePackAndCheckConnectivity()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 848
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/BaseReceivePack;->receivePack()V

    .line 849
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/BaseReceivePack;->needCheckConnectivity()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 850
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/BaseReceivePack;->checkConnectivity()V

    .line 851
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->parser:Lorg/eclipse/jgit/transport/PackParser;

    .line 852
    return-void
.end method

.method protected recvCommands()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 917
    :goto_0
    :try_start_0
    iget-object v8, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->pckIn:Lorg/eclipse/jgit/transport/PacketLineIn;

    invoke-virtual {v8}, Lorg/eclipse/jgit/transport/PacketLineIn;->readStringRaw()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 923
    .local v3, line:Ljava/lang/String;
    sget-object v8, Lorg/eclipse/jgit/transport/PacketLineIn;->END:Ljava/lang/String;

    if-ne v3, v8, :cond_1

    .line 949
    .end local v3           #line:Ljava/lang/String;
    :cond_0
    return-void

    .line 918
    :catch_0
    move-exception v1

    .line 919
    .local v1, eof:Ljava/io/EOFException;
    iget-object v8, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->commands:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_0

    .line 921
    throw v1

    .line 926
    .end local v1           #eof:Ljava/io/EOFException;
    .restart local v3       #line:Ljava/lang/String;
    :cond_1
    iget-object v8, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->commands:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 927
    new-instance v2, Lorg/eclipse/jgit/transport/BaseReceivePack$FirstLine;

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/transport/BaseReceivePack$FirstLine;-><init>(Ljava/lang/String;)V

    .line 928
    .local v2, firstLine:Lorg/eclipse/jgit/transport/BaseReceivePack$FirstLine;
    invoke-virtual {v2}, Lorg/eclipse/jgit/transport/BaseReceivePack$FirstLine;->getCapabilities()Ljava/util/Set;

    move-result-object v8

    iput-object v8, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->enabledCapabilities:Ljava/util/Set;

    .line 929
    invoke-virtual {v2}, Lorg/eclipse/jgit/transport/BaseReceivePack$FirstLine;->getLine()Ljava/lang/String;

    move-result-object v3

    .line 932
    .end local v2           #firstLine:Lorg/eclipse/jgit/transport/BaseReceivePack$FirstLine;
    :cond_2
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v8

    const/16 v9, 0x53

    if-ge v8, v9, :cond_3

    .line 933
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v4, v8, Lorg/eclipse/jgit/internal/JGitText;->errorInvalidProtocolWantedOldNewRef:Ljava/lang/String;

    .line 934
    .local v4, m:Ljava/lang/String;
    invoke-virtual {p0, v4}, Lorg/eclipse/jgit/transport/BaseReceivePack;->sendError(Ljava/lang/String;)V

    .line 935
    new-instance v8, Lorg/eclipse/jgit/errors/PackProtocolException;

    invoke-direct {v8, v4}, Lorg/eclipse/jgit/errors/PackProtocolException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 938
    .end local v4           #m:Ljava/lang/String;
    :cond_3
    const/4 v8, 0x0

    const/16 v9, 0x28

    invoke-virtual {v3, v8, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lorg/eclipse/jgit/lib/ObjectId;->fromString(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v7

    .line 939
    .local v7, oldId:Lorg/eclipse/jgit/lib/ObjectId;
    const/16 v8, 0x29

    const/16 v9, 0x51

    invoke-virtual {v3, v8, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lorg/eclipse/jgit/lib/ObjectId;->fromString(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    .line 940
    .local v6, newId:Lorg/eclipse/jgit/lib/ObjectId;
    const/16 v8, 0x52

    invoke-virtual {v3, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 941
    .local v5, name:Ljava/lang/String;
    new-instance v0, Lorg/eclipse/jgit/transport/ReceiveCommand;

    invoke-direct {v0, v7, v6, v5}, Lorg/eclipse/jgit/transport/ReceiveCommand;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V

    .line 942
    .local v0, cmd:Lorg/eclipse/jgit/transport/ReceiveCommand;
    const-string v8, "HEAD"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 943
    sget-object v8, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->REJECTED_CURRENT_BRANCH:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    invoke-virtual {v0, v8}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;)V

    .line 947
    :goto_1
    iget-object v8, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->commands:Ljava/util/List;

    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 945
    :cond_4
    iget-object v8, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->refs:Ljava/util/Map;

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getRefName()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/eclipse/jgit/lib/Ref;

    invoke-virtual {v0, v8}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setRef(Lorg/eclipse/jgit/lib/Ref;)V

    goto :goto_1
.end method

.method protected release()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 1406
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    .line 1407
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BaseReceivePack;->unlockPack()V

    .line 1408
    iput-object v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->timeoutIn:Lorg/eclipse/jgit/util/io/TimeoutInputStream;

    .line 1409
    iput-object v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->rawIn:Ljava/io/InputStream;

    .line 1410
    iput-object v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->rawOut:Ljava/io/OutputStream;

    .line 1411
    iput-object v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->msgOut:Ljava/io/OutputStream;

    .line 1412
    iput-object v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->pckIn:Lorg/eclipse/jgit/transport/PacketLineIn;

    .line 1413
    iput-object v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->pckOut:Lorg/eclipse/jgit/transport/PacketLineOut;

    .line 1414
    iput-object v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->refs:Ljava/util/Map;

    .line 1415
    iput-object v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->enabledCapabilities:Ljava/util/Set;

    .line 1416
    iput-object v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->commands:Ljava/util/List;

    .line 1417
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->timer:Lorg/eclipse/jgit/util/io/InterruptTimer;

    if-eqz v0, :cond_0

    .line 1419
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->timer:Lorg/eclipse/jgit/util/io/InterruptTimer;

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/io/InterruptTimer;->terminate()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1421
    iput-object v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->timer:Lorg/eclipse/jgit/util/io/InterruptTimer;

    .line 1424
    :cond_0
    return-void

    .line 1421
    :catchall_0
    move-exception v0

    iput-object v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->timer:Lorg/eclipse/jgit/util/io/InterruptTimer;

    throw v0
.end method

.method public sendAdvertisedRefs(Lorg/eclipse/jgit/transport/RefAdvertiser;)V
    .locals 5
    .parameter "adv"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;
        }
    .end annotation

    .prologue
    .line 879
    iget-object v3, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->advertiseError:Ljava/lang/StringBuilder;

    if-eqz v3, :cond_0

    .line 880
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ERR "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->advertiseError:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Lorg/eclipse/jgit/transport/RefAdvertiser;->writeOne(Ljava/lang/CharSequence;)V

    .line 906
    :goto_0
    return-void

    .line 885
    :cond_0
    :try_start_0
    iget-object v3, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->advertiseRefsHook:Lorg/eclipse/jgit/transport/AdvertiseRefsHook;

    invoke-interface {v3, p0}, Lorg/eclipse/jgit/transport/AdvertiseRefsHook;->advertiseRefs(Lorg/eclipse/jgit/transport/BaseReceivePack;)V
    :try_end_0
    .catch Lorg/eclipse/jgit/transport/ServiceMayNotContinueException; {:try_start_0 .. :try_end_0} :catch_0

    .line 894
    iget-object v3, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {p1, v3}, Lorg/eclipse/jgit/transport/RefAdvertiser;->init(Lorg/eclipse/jgit/lib/Repository;)V

    .line 895
    const-string v3, "side-band-64k"

    invoke-virtual {p1, v3}, Lorg/eclipse/jgit/transport/RefAdvertiser;->advertiseCapability(Ljava/lang/String;)V

    .line 896
    const-string v3, "delete-refs"

    invoke-virtual {p1, v3}, Lorg/eclipse/jgit/transport/RefAdvertiser;->advertiseCapability(Ljava/lang/String;)V

    .line 897
    const-string v3, "report-status"

    invoke-virtual {p1, v3}, Lorg/eclipse/jgit/transport/RefAdvertiser;->advertiseCapability(Ljava/lang/String;)V

    .line 898
    iget-boolean v3, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->allowOfsDelta:Z

    if-eqz v3, :cond_1

    .line 899
    const-string v3, "ofs-delta"

    invoke-virtual {p1, v3}, Lorg/eclipse/jgit/transport/RefAdvertiser;->advertiseCapability(Ljava/lang/String;)V

    .line 900
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BaseReceivePack;->getAdvertisedOrDefaultRefs()Ljava/util/Map;

    move-result-object v3

    invoke-virtual {p1, v3}, Lorg/eclipse/jgit/transport/RefAdvertiser;->send(Ljava/util/Map;)Ljava/util/Set;

    .line 901
    iget-object v3, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->advertisedHaves:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/lib/ObjectId;

    .line 902
    .local v2, obj:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-virtual {p1, v2}, Lorg/eclipse/jgit/transport/RefAdvertiser;->advertiseHave(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    goto :goto_1

    .line 886
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v2           #obj:Lorg/eclipse/jgit/lib/ObjectId;
    :catch_0
    move-exception v0

    .line 887
    .local v0, fail:Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;->getMessage()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 888
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ERR "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Lorg/eclipse/jgit/transport/RefAdvertiser;->writeOne(Ljava/lang/CharSequence;)V

    .line 889
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;->setOutput()V

    .line 891
    :cond_2
    throw v0

    .line 903
    .end local v0           #fail:Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;
    .restart local v1       #i$:Ljava/util/Iterator;
    :cond_3
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/RefAdvertiser;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 904
    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    const-string v4, "capabilities^{}"

    invoke-virtual {p1, v3, v4}, Lorg/eclipse/jgit/transport/RefAdvertiser;->advertiseId(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;)V

    .line 905
    :cond_4
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/RefAdvertiser;->end()V

    goto :goto_0
.end method

.method public sendError(Ljava/lang/String;)V
    .locals 3
    .parameter "what"

    .prologue
    .line 729
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->refs:Ljava/util/Map;

    if-nez v0, :cond_1

    .line 730
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->advertiseError:Ljava/lang/StringBuilder;

    if-nez v0, :cond_0

    .line 731
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->advertiseError:Ljava/lang/StringBuilder;

    .line 732
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->advertiseError:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 736
    :goto_0
    return-void

    .line 734
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->msgOutWrapper:Lorg/eclipse/jgit/transport/BaseReceivePack$MessageOutputWrapper;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "error: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/transport/BaseReceivePack$MessageOutputWrapper;->write([B)V

    goto :goto_0
.end method

.method public sendMessage(Ljava/lang/String;)V
    .locals 3
    .parameter "what"

    .prologue
    .line 749
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->msgOutWrapper:Lorg/eclipse/jgit/transport/BaseReceivePack$MessageOutputWrapper;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/transport/BaseReceivePack$MessageOutputWrapper;->write([B)V

    .line 750
    return-void
.end method

.method protected sendStatusReport(ZLjava/lang/Throwable;Lorg/eclipse/jgit/transport/BaseReceivePack$Reporter;)V
    .locals 5
    .parameter "forClient"
    .parameter "unpackError"
    .parameter "out"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1290
    if-eqz p2, :cond_0

    .line 1291
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "unpack error "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p3, v3}, Lorg/eclipse/jgit/transport/BaseReceivePack$Reporter;->sendString(Ljava/lang/String;)V

    .line 1292
    if-eqz p1, :cond_9

    .line 1293
    iget-object v3, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->commands:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_9

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/transport/ReceiveCommand;

    .line 1294
    .local v0, cmd:Lorg/eclipse/jgit/transport/ReceiveCommand;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ng "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getRefName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " n/a (unpacker error)"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p3, v3}, Lorg/eclipse/jgit/transport/BaseReceivePack$Reporter;->sendString(Ljava/lang/String;)V

    goto :goto_0

    .line 1301
    .end local v0           #cmd:Lorg/eclipse/jgit/transport/ReceiveCommand;
    .end local v1           #i$:Ljava/util/Iterator;
    :cond_0
    if-eqz p1, :cond_1

    .line 1302
    const-string v3, "unpack ok"

    invoke-virtual {p3, v3}, Lorg/eclipse/jgit/transport/BaseReceivePack$Reporter;->sendString(Ljava/lang/String;)V

    .line 1303
    :cond_1
    iget-object v3, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->commands:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .restart local v1       #i$:Ljava/util/Iterator;
    :cond_2
    :goto_1
    :pswitch_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_9

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/transport/ReceiveCommand;

    .line 1304
    .restart local v0       #cmd:Lorg/eclipse/jgit/transport/ReceiveCommand;
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getResult()Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    move-result-object v3

    sget-object v4, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->OK:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    if-ne v3, v4, :cond_3

    .line 1305
    if-eqz p1, :cond_2

    .line 1306
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ok "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getRefName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p3, v3}, Lorg/eclipse/jgit/transport/BaseReceivePack$Reporter;->sendString(Ljava/lang/String;)V

    goto :goto_1

    .line 1310
    :cond_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 1311
    .local v2, r:Ljava/lang/StringBuilder;
    if-eqz p1, :cond_5

    .line 1312
    const-string v3, "ng "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getRefName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1316
    :goto_2
    sget-object v3, Lorg/eclipse/jgit/transport/BaseReceivePack$2;->$SwitchMap$org$eclipse$jgit$transport$ReceiveCommand$Result:[I

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getResult()Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    move-result-object v4

    invoke-virtual {v4}, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 1361
    :goto_3
    if-nez p1, :cond_4

    .line 1362
    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1363
    :cond_4
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p3, v3}, Lorg/eclipse/jgit/transport/BaseReceivePack$Reporter;->sendString(Ljava/lang/String;)V

    goto :goto_1

    .line 1314
    :cond_5
    const-string v3, " ! [rejected] "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getRefName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 1318
    :pswitch_1
    const-string v3, "server bug; ref not processed"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 1322
    :pswitch_2
    const-string v3, "creation prohibited"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 1326
    :pswitch_3
    const-string v3, "deletion prohibited"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 1330
    :pswitch_4
    const-string v3, "non-fast forward"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 1334
    :pswitch_5
    const-string v3, "branch is currently checked out"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 1338
    :pswitch_6
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getMessage()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_6

    .line 1339
    const-string v3, "missing object(s)"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 1340
    :cond_6
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x28

    if-ne v3, v4, :cond_7

    .line 1341
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "object "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " missing"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 1343
    :cond_7
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_3

    .line 1347
    :pswitch_7
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getMessage()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_8

    .line 1348
    const-string v3, "unspecified reason"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_3

    .line 1350
    :cond_8
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_3

    .line 1354
    :pswitch_8
    const-string v3, "failed to lock"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_3

    .line 1365
    .end local v0           #cmd:Lorg/eclipse/jgit/transport/ReceiveCommand;
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v2           #r:Ljava/lang/StringBuilder;
    :cond_9
    return-void

    .line 1316
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_0
    .end packed-switch
.end method

.method public setAdvertiseRefsHook(Lorg/eclipse/jgit/transport/AdvertiseRefsHook;)V
    .locals 1
    .parameter "advertiseRefsHook"

    .prologue
    .line 615
    if-eqz p1, :cond_0

    .line 616
    iput-object p1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->advertiseRefsHook:Lorg/eclipse/jgit/transport/AdvertiseRefsHook;

    .line 619
    :goto_0
    return-void

    .line 618
    :cond_0
    sget-object v0, Lorg/eclipse/jgit/transport/AdvertiseRefsHook;->DEFAULT:Lorg/eclipse/jgit/transport/AdvertiseRefsHook;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->advertiseRefsHook:Lorg/eclipse/jgit/transport/AdvertiseRefsHook;

    goto :goto_0
.end method

.method public setAdvertisedRefs(Ljava/util/Map;Ljava/util/Set;)V
    .locals 5
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 401
    .local p1, allRefs:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    .local p2, additionalHaves:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    if-eqz p1, :cond_2

    .end local p1           #allRefs:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    :goto_0
    iput-object p1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->refs:Ljava/util/Map;

    .line 402
    iget-object v3, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->refFilter:Lorg/eclipse/jgit/transport/RefFilter;

    iget-object v4, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->refs:Ljava/util/Map;

    invoke-interface {v3, v4}, Lorg/eclipse/jgit/transport/RefFilter;->filter(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v3

    iput-object v3, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->refs:Ljava/util/Map;

    .line 404
    iget-object v3, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->refs:Ljava/util/Map;

    const-string v4, "HEAD"

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/Ref;

    .line 405
    .local v0, head:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->isSymbolic()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 406
    iget-object v3, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->refs:Ljava/util/Map;

    const-string v4, "HEAD"

    invoke-interface {v3, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 408
    :cond_0
    iget-object v3, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->refs:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_1
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/lib/Ref;

    .line 409
    .local v2, ref:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v2}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 410
    iget-object v3, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->advertisedHaves:Ljava/util/Set;

    invoke-interface {v2}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 401
    .end local v0           #head:Lorg/eclipse/jgit/lib/Ref;
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v2           #ref:Lorg/eclipse/jgit/lib/Ref;
    .restart local p1       #allRefs:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    :cond_2
    iget-object v3, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/Repository;->getAllRefs()Ljava/util/Map;

    move-result-object p1

    goto :goto_0

    .line 412
    .end local p1           #allRefs:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    .restart local v0       #head:Lorg/eclipse/jgit/lib/Ref;
    .restart local v1       #i$:Ljava/util/Iterator;
    :cond_3
    if-eqz p2, :cond_4

    .line 413
    iget-object v3, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->advertisedHaves:Ljava/util/Set;

    invoke-interface {v3, p2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 416
    :goto_2
    return-void

    .line 415
    :cond_4
    iget-object v3, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->advertisedHaves:Ljava/util/Set;

    iget-object v4, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/Repository;->getAdditionalHaves()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto :goto_2
.end method

.method public setAllowCreates(Z)V
    .locals 0
    .parameter "canCreate"

    .prologue
    .line 537
    iput-boolean p1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->allowCreates:Z

    .line 538
    return-void
.end method

.method public setAllowDeletes(Z)V
    .locals 0
    .parameter "canDelete"

    .prologue
    .line 550
    iput-boolean p1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->allowDeletes:Z

    .line 551
    return-void
.end method

.method public setAllowNonFastForwards(Z)V
    .locals 0
    .parameter "canRewind"

    .prologue
    .line 567
    iput-boolean p1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->allowNonFastForwards:Z

    .line 568
    return-void
.end method

.method public setBiDirectionalPipe(Z)V
    .locals 0
    .parameter "twoWay"

    .prologue
    .line 480
    iput-boolean p1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->biDirectionalPipe:Z

    .line 481
    return-void
.end method

.method public setCheckReceivedObjects(Z)V
    .locals 1
    .parameter "check"

    .prologue
    .line 512
    if-eqz p1, :cond_1

    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->objectChecker:Lorg/eclipse/jgit/lib/ObjectChecker;

    if-nez v0, :cond_1

    .line 513
    new-instance v0, Lorg/eclipse/jgit/lib/ObjectChecker;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/ObjectChecker;-><init>()V

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/BaseReceivePack;->setObjectChecker(Lorg/eclipse/jgit/lib/ObjectChecker;)V

    .line 516
    :cond_0
    :goto_0
    return-void

    .line 514
    :cond_1
    if-nez p1, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->objectChecker:Lorg/eclipse/jgit/lib/ObjectChecker;

    if-eqz v0, :cond_0

    .line 515
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/BaseReceivePack;->setObjectChecker(Lorg/eclipse/jgit/lib/ObjectChecker;)V

    goto :goto_0
.end method

.method public setCheckReferencedObjectsAreReachable(Z)V
    .locals 0
    .parameter "b"

    .prologue
    .line 459
    iput-boolean p1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->checkReferencedIsReachable:Z

    .line 460
    return-void
.end method

.method public setExpectDataAfterPackFooter(Z)V
    .locals 0
    .parameter "e"

    .prologue
    .line 493
    iput-boolean p1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->expectDataAfterPackFooter:Z

    .line 494
    return-void
.end method

.method public setMaxObjectSizeLimit(J)V
    .locals 0
    .parameter "limit"

    .prologue
    .line 662
    iput-wide p1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->maxObjectSizeLimit:J

    .line 663
    return-void
.end method

.method public setMaxPackSizeLimit(J)V
    .locals 5
    .parameter "limit"

    .prologue
    .line 677
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_0

    .line 678
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->receivePackInvalidLimit:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 680
    :cond_0
    iput-wide p1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->maxPackSizeLimit:J

    .line 681
    return-void
.end method

.method public setObjectChecker(Lorg/eclipse/jgit/lib/ObjectChecker;)V
    .locals 0
    .parameter "impl"

    .prologue
    .line 524
    iput-object p1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->objectChecker:Lorg/eclipse/jgit/lib/ObjectChecker;

    .line 525
    return-void
.end method

.method public setRefFilter(Lorg/eclipse/jgit/transport/RefFilter;)V
    .locals 0
    .parameter "refFilter"

    .prologue
    .line 632
    if-eqz p1, :cond_0

    .end local p1
    :goto_0
    iput-object p1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->refFilter:Lorg/eclipse/jgit/transport/RefFilter;

    .line 633
    return-void

    .line 632
    .restart local p1
    :cond_0
    sget-object p1, Lorg/eclipse/jgit/transport/RefFilter;->DEFAULT:Lorg/eclipse/jgit/transport/RefFilter;

    goto :goto_0
.end method

.method public setRefLogIdent(Lorg/eclipse/jgit/lib/PersonIdent;)V
    .locals 0
    .parameter "pi"

    .prologue
    .line 588
    iput-object p1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->refLogIdent:Lorg/eclipse/jgit/lib/PersonIdent;

    .line 589
    return-void
.end method

.method public setTimeout(I)V
    .locals 0
    .parameter "seconds"

    .prologue
    .line 649
    iput p1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->timeout:I

    .line 650
    return-void
.end method

.method protected unlockPack()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 861
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->packLock:Lorg/eclipse/jgit/internal/storage/file/PackLock;

    if-eqz v0, :cond_0

    .line 862
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->packLock:Lorg/eclipse/jgit/internal/storage/file/PackLock;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/PackLock;->unlock()V

    .line 863
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->packLock:Lorg/eclipse/jgit/internal/storage/file/PackLock;

    .line 865
    :cond_0
    return-void
.end method

.method protected validateCommands()V
    .locals 8

    .prologue
    .line 1119
    iget-object v6, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->commands:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/transport/ReceiveCommand;

    .line 1120
    .local v0, cmd:Lorg/eclipse/jgit/transport/ReceiveCommand;
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getRef()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v5

    .line 1121
    .local v5, ref:Lorg/eclipse/jgit/lib/Ref;
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getResult()Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    move-result-object v6

    sget-object v7, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->NOT_ATTEMPTED:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    if-ne v6, v7, :cond_0

    .line 1124
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getType()Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    move-result-object v6

    sget-object v7, Lorg/eclipse/jgit/transport/ReceiveCommand$Type;->DELETE:Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    if-ne v6, v7, :cond_1

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BaseReceivePack;->isAllowDeletes()Z

    move-result v6

    if-nez v6, :cond_1

    .line 1128
    sget-object v6, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->REJECTED_NODELETE:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    invoke-virtual {v0, v6}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;)V

    goto :goto_0

    .line 1132
    :cond_1
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getType()Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    move-result-object v6

    sget-object v7, Lorg/eclipse/jgit/transport/ReceiveCommand$Type;->CREATE:Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    if-ne v6, v7, :cond_4

    .line 1133
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BaseReceivePack;->isAllowCreates()Z

    move-result v6

    if-nez v6, :cond_2

    .line 1134
    sget-object v6, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->REJECTED_NOCREATE:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    invoke-virtual {v0, v6}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;)V

    goto :goto_0

    .line 1138
    :cond_2
    if-eqz v5, :cond_3

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BaseReceivePack;->isAllowNonFastForwards()Z

    move-result v6

    if-nez v6, :cond_3

    .line 1142
    sget-object v6, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->REJECTED_NONFASTFORWARD:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    invoke-virtual {v0, v6}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;)V

    goto :goto_0

    .line 1146
    :cond_3
    if-eqz v5, :cond_4

    .line 1150
    sget-object v6, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->REJECTED_OTHER_REASON:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->refAlreadyExists:Ljava/lang/String;

    invoke-virtual {v0, v6, v7}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;Ljava/lang/String;)V

    goto :goto_0

    .line 1156
    :cond_4
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getType()Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    move-result-object v6

    sget-object v7, Lorg/eclipse/jgit/transport/ReceiveCommand$Type;->DELETE:Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    if-ne v6, v7, :cond_5

    if-eqz v5, :cond_5

    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getOldId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v6

    if-nez v6, :cond_5

    invoke-interface {v5}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getOldId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v6

    if-nez v6, :cond_5

    .line 1163
    sget-object v6, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->REJECTED_OTHER_REASON:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->invalidOldIdSent:Ljava/lang/String;

    invoke-virtual {v0, v6, v7}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1168
    :cond_5
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getType()Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    move-result-object v6

    sget-object v7, Lorg/eclipse/jgit/transport/ReceiveCommand$Type;->UPDATE:Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    if-ne v6, v7, :cond_a

    .line 1169
    if-nez v5, :cond_6

    .line 1172
    sget-object v6, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->REJECTED_OTHER_REASON:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->noSuchRef:Ljava/lang/String;

    invoke-virtual {v0, v6, v7}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1176
    :cond_6
    invoke-interface {v5}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getOldId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v6

    if-nez v6, :cond_7

    .line 1180
    sget-object v6, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->REJECTED_OTHER_REASON:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->invalidOldIdSent:Ljava/lang/String;

    invoke-virtual {v0, v6, v7}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1189
    :cond_7
    :try_start_0
    iget-object v6, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getOldId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 1197
    .local v4, oldObj:Lorg/eclipse/jgit/revwalk/RevObject;
    :try_start_1
    iget-object v6, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getNewId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v3

    .line 1204
    .local v3, newObj:Lorg/eclipse/jgit/revwalk/RevObject;
    instance-of v6, v4, Lorg/eclipse/jgit/revwalk/RevCommit;

    if-eqz v6, :cond_9

    instance-of v6, v3, Lorg/eclipse/jgit/revwalk/RevCommit;

    if-eqz v6, :cond_9

    .line 1206
    :try_start_2
    iget-object v6, p0, Lorg/eclipse/jgit/transport/BaseReceivePack;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    check-cast v4, Lorg/eclipse/jgit/revwalk/RevCommit;

    .end local v4           #oldObj:Lorg/eclipse/jgit/revwalk/RevObject;
    check-cast v3, Lorg/eclipse/jgit/revwalk/RevCommit;

    .end local v3           #newObj:Lorg/eclipse/jgit/revwalk/RevObject;
    invoke-virtual {v6, v4, v3}, Lorg/eclipse/jgit/revwalk/RevWalk;->isMergedInto(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 1208
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setTypeFastForwardUpdate()V
    :try_end_2
    .catch Lorg/eclipse/jgit/errors/MissingObjectException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    .line 1221
    :goto_1
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getType()Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    move-result-object v6

    sget-object v7, Lorg/eclipse/jgit/transport/ReceiveCommand$Type;->UPDATE_NONFASTFORWARD:Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    if-ne v6, v7, :cond_a

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BaseReceivePack;->isAllowNonFastForwards()Z

    move-result v6

    if-nez v6, :cond_a

    .line 1223
    sget-object v6, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->REJECTED_NONFASTFORWARD:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    invoke-virtual {v0, v6}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;)V

    goto/16 :goto_0

    .line 1190
    :catch_0
    move-exception v1

    .line 1191
    .local v1, e:Ljava/io/IOException;
    sget-object v6, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->REJECTED_MISSING_OBJECT:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getOldId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v7

    invoke-virtual {v7}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v6, v7}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1198
    .end local v1           #e:Ljava/io/IOException;
    .restart local v4       #oldObj:Lorg/eclipse/jgit/revwalk/RevObject;
    :catch_1
    move-exception v1

    .line 1199
    .restart local v1       #e:Ljava/io/IOException;
    sget-object v6, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->REJECTED_MISSING_OBJECT:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getNewId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v7

    invoke-virtual {v7}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v6, v7}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1210
    .end local v1           #e:Ljava/io/IOException;
    .end local v4           #oldObj:Lorg/eclipse/jgit/revwalk/RevObject;
    :cond_8
    :try_start_3
    sget-object v6, Lorg/eclipse/jgit/transport/ReceiveCommand$Type;->UPDATE_NONFASTFORWARD:Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    invoke-virtual {v0, v6}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setType(Lorg/eclipse/jgit/transport/ReceiveCommand$Type;)V
    :try_end_3
    .catch Lorg/eclipse/jgit/errors/MissingObjectException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_1

    .line 1211
    :catch_2
    move-exception v1

    .line 1212
    .local v1, e:Lorg/eclipse/jgit/errors/MissingObjectException;
    sget-object v6, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->REJECTED_MISSING_OBJECT:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    invoke-virtual {v1}, Lorg/eclipse/jgit/errors/MissingObjectException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v6, v7}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;Ljava/lang/String;)V

    goto :goto_1

    .line 1214
    .end local v1           #e:Lorg/eclipse/jgit/errors/MissingObjectException;
    :catch_3
    move-exception v1

    .line 1215
    .local v1, e:Ljava/io/IOException;
    sget-object v6, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->REJECTED_OTHER_REASON:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    invoke-virtual {v0, v6}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;)V

    goto :goto_1

    .line 1218
    .end local v1           #e:Ljava/io/IOException;
    .restart local v3       #newObj:Lorg/eclipse/jgit/revwalk/RevObject;
    .restart local v4       #oldObj:Lorg/eclipse/jgit/revwalk/RevObject;
    :cond_9
    sget-object v6, Lorg/eclipse/jgit/transport/ReceiveCommand$Type;->UPDATE_NONFASTFORWARD:Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    invoke-virtual {v0, v6}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setType(Lorg/eclipse/jgit/transport/ReceiveCommand$Type;)V

    goto :goto_1

    .line 1228
    .end local v3           #newObj:Lorg/eclipse/jgit/revwalk/RevObject;
    .end local v4           #oldObj:Lorg/eclipse/jgit/revwalk/RevObject;
    :cond_a
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getRefName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "refs/"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_b

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getRefName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lorg/eclipse/jgit/lib/Repository;->isValidRefName(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 1230
    :cond_b
    sget-object v6, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->REJECTED_OTHER_REASON:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->funnyRefname:Ljava/lang/String;

    invoke-virtual {v0, v6, v7}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1233
    .end local v0           #cmd:Lorg/eclipse/jgit/transport/ReceiveCommand;
    .end local v5           #ref:Lorg/eclipse/jgit/lib/Ref;
    :cond_c
    return-void
.end method
