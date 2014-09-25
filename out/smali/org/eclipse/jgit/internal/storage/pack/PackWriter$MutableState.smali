.class Lorg/eclipse/jgit/internal/storage/pack/PackWriter$MutableState;
.super Ljava/lang/Object;
.source "PackWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/pack/PackWriter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MutableState"
.end annotation


# static fields
.field private static final OBJECT_TO_PACK_SIZE:J = 0x78L


# instance fields
.field private volatile phase:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

.field final synthetic this$0:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;

.field private final totalDeltaSearchBytes:J


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;)V
    .locals 5
    .parameter

    .prologue
    .line 2396
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$MutableState;->this$0:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2397
    sget-object v1, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;->COUNTING:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$MutableState;->phase:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    .line 2398
    #getter for: Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;
    invoke-static {p1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->access$200(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;)Lorg/eclipse/jgit/storage/pack/PackConfig;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/storage/pack/PackConfig;->isDeltaCompress()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2399
    #getter for: Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;
    invoke-static {p1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->access$200(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;)Lorg/eclipse/jgit/storage/pack/PackConfig;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getThreads()I

    move-result v0

    .line 2400
    .local v0, threads:I
    if-gtz v0, :cond_0

    .line 2401
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v0

    .line 2402
    :cond_0
    int-to-long v1, v0

    #getter for: Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;
    invoke-static {p1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->access$200(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;)Lorg/eclipse/jgit/storage/pack/PackConfig;

    move-result-object v3

    invoke-virtual {v3}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getDeltaSearchMemoryLimit()J

    move-result-wide v3

    mul-long/2addr v1, v3

    #getter for: Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->config:Lorg/eclipse/jgit/storage/pack/PackConfig;
    invoke-static {p1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->access$200(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;)Lorg/eclipse/jgit/storage/pack/PackConfig;

    move-result-object v3

    invoke-virtual {v3}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getBigFileThreshold()I

    move-result v3

    int-to-long v3, v3

    add-long/2addr v1, v3

    iput-wide v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$MutableState;->totalDeltaSearchBytes:J

    .line 2406
    .end local v0           #threads:I
    :goto_0
    return-void

    .line 2405
    :cond_1
    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$MutableState;->totalDeltaSearchBytes:J

    goto :goto_0
.end method

.method static synthetic access$102(Lorg/eclipse/jgit/internal/storage/pack/PackWriter$MutableState;Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;)Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 2381
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$MutableState;->phase:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    return-object p1
.end method


# virtual methods
.method snapshot()Lorg/eclipse/jgit/internal/storage/pack/PackWriter$State;
    .locals 7

    .prologue
    .line 2409
    const-wide/16 v3, 0x0

    .line 2410
    .local v3, objCnt:J
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$MutableState;->this$0:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;

    #getter for: Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;
    invoke-static {v5}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->access$300(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;)[Lorg/eclipse/jgit/util/BlockList;

    move-result-object v5

    const/4 v6, 0x1

    aget-object v5, v5, v6

    invoke-virtual {v5}, Lorg/eclipse/jgit/util/BlockList;->size()I

    move-result v5

    int-to-long v5, v5

    add-long/2addr v3, v5

    .line 2411
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$MutableState;->this$0:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;

    #getter for: Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;
    invoke-static {v5}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->access$300(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;)[Lorg/eclipse/jgit/util/BlockList;

    move-result-object v5

    const/4 v6, 0x2

    aget-object v5, v5, v6

    invoke-virtual {v5}, Lorg/eclipse/jgit/util/BlockList;->size()I

    move-result v5

    int-to-long v5, v5

    add-long/2addr v3, v5

    .line 2412
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$MutableState;->this$0:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;

    #getter for: Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;
    invoke-static {v5}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->access$300(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;)[Lorg/eclipse/jgit/util/BlockList;

    move-result-object v5

    const/4 v6, 0x3

    aget-object v5, v5, v6

    invoke-virtual {v5}, Lorg/eclipse/jgit/util/BlockList;->size()I

    move-result v5

    int-to-long v5, v5

    add-long/2addr v3, v5

    .line 2413
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$MutableState;->this$0:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;

    #getter for: Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->objectsLists:[Lorg/eclipse/jgit/util/BlockList;
    invoke-static {v5}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->access$300(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;)[Lorg/eclipse/jgit/util/BlockList;

    move-result-object v5

    const/4 v6, 0x4

    aget-object v5, v5, v6

    invoke-virtual {v5}, Lorg/eclipse/jgit/util/BlockList;->size()I

    move-result v5

    int-to-long v5, v5

    add-long/2addr v3, v5

    .line 2416
    const-wide/16 v5, 0x78

    mul-long v0, v5, v3

    .line 2417
    .local v0, bytesUsed:J
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$MutableState;->phase:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    .line 2418
    .local v2, curr:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;
    sget-object v5, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;->COMPRESSING:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    if-ne v2, v5, :cond_0

    .line 2419
    iget-wide v5, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$MutableState;->totalDeltaSearchBytes:J

    add-long/2addr v0, v5

    .line 2420
    :cond_0
    new-instance v5, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$State;

    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$MutableState;->this$0:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;

    invoke-direct {v5, v6, v2, v0, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$State;-><init>(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;J)V

    return-object v5
.end method
