.class public Lorg/eclipse/jgit/lib/InflaterCache;
.super Ljava/lang/Object;
.source "InflaterCache.java"


# static fields
.field private static final SZ:I = 0x4

.field private static final inflaterCache:[Ljava/util/zip/Inflater;

.field private static openInflaterCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 58
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/util/zip/Inflater;

    sput-object v0, Lorg/eclipse/jgit/lib/InflaterCache;->inflaterCache:[Ljava/util/zip/Inflater;

    .line 59
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 107
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public static get()Ljava/util/zip/Inflater;
    .locals 2

    .prologue
    .line 70
    invoke-static {}, Lorg/eclipse/jgit/lib/InflaterCache;->getImpl()Ljava/util/zip/Inflater;

    move-result-object v0

    .line 71
    .local v0, r:Ljava/util/zip/Inflater;
    if-eqz v0, :cond_0

    .end local v0           #r:Ljava/util/zip/Inflater;
    :goto_0
    return-object v0

    .restart local v0       #r:Ljava/util/zip/Inflater;
    :cond_0
    new-instance v0, Ljava/util/zip/Inflater;

    .end local v0           #r:Ljava/util/zip/Inflater;
    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/zip/Inflater;-><init>(Z)V

    goto :goto_0
.end method

.method private static declared-synchronized getImpl()Ljava/util/zip/Inflater;
    .locals 5

    .prologue
    const/4 v0, 0x0

    .line 75
    const-class v2, Lorg/eclipse/jgit/lib/InflaterCache;

    monitor-enter v2

    :try_start_0
    sget v1, Lorg/eclipse/jgit/lib/InflaterCache;->openInflaterCount:I

    if-lez v1, :cond_0

    .line 76
    sget-object v1, Lorg/eclipse/jgit/lib/InflaterCache;->inflaterCache:[Ljava/util/zip/Inflater;

    sget v3, Lorg/eclipse/jgit/lib/InflaterCache;->openInflaterCount:I

    add-int/lit8 v3, v3, -0x1

    sput v3, Lorg/eclipse/jgit/lib/InflaterCache;->openInflaterCount:I

    aget-object v0, v1, v3

    .line 77
    .local v0, r:Ljava/util/zip/Inflater;
    sget-object v1, Lorg/eclipse/jgit/lib/InflaterCache;->inflaterCache:[Ljava/util/zip/Inflater;

    sget v3, Lorg/eclipse/jgit/lib/InflaterCache;->openInflaterCount:I

    const/4 v4, 0x0

    aput-object v4, v1, v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 80
    :cond_0
    monitor-exit v2

    return-object v0

    .line 75
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static release(Ljava/util/zip/Inflater;)V
    .locals 1
    .parameter "i"

    .prologue
    .line 91
    if-eqz p0, :cond_0

    .line 92
    invoke-virtual {p0}, Ljava/util/zip/Inflater;->reset()V

    .line 93
    invoke-static {p0}, Lorg/eclipse/jgit/lib/InflaterCache;->releaseImpl(Ljava/util/zip/Inflater;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 94
    invoke-virtual {p0}, Ljava/util/zip/Inflater;->end()V

    .line 96
    :cond_0
    return-void
.end method

.method private static declared-synchronized releaseImpl(Ljava/util/zip/Inflater;)Z
    .locals 4
    .parameter "i"

    .prologue
    .line 99
    const-class v1, Lorg/eclipse/jgit/lib/InflaterCache;

    monitor-enter v1

    :try_start_0
    sget v0, Lorg/eclipse/jgit/lib/InflaterCache;->openInflaterCount:I

    const/4 v2, 0x4

    if-ge v0, v2, :cond_0

    .line 100
    sget-object v0, Lorg/eclipse/jgit/lib/InflaterCache;->inflaterCache:[Ljava/util/zip/Inflater;

    sget v2, Lorg/eclipse/jgit/lib/InflaterCache;->openInflaterCount:I

    add-int/lit8 v3, v2, 0x1

    sput v3, Lorg/eclipse/jgit/lib/InflaterCache;->openInflaterCount:I

    aput-object p0, v0, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 101
    const/4 v0, 0x0

    .line 103
    :goto_0
    monitor-exit v1

    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    .line 99
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method
