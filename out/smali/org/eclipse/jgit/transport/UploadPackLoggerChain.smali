.class public Lorg/eclipse/jgit/transport/UploadPackLoggerChain;
.super Ljava/lang/Object;
.source "UploadPackLoggerChain.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/UploadPackLogger;


# instance fields
.field private final count:I

.field private final loggers:[Lorg/eclipse/jgit/transport/UploadPackLogger;


# direct methods
.method private constructor <init>([Lorg/eclipse/jgit/transport/UploadPackLogger;I)V
    .locals 0
    .parameter "loggers"
    .parameter "count"

    .prologue
    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    iput-object p1, p0, Lorg/eclipse/jgit/transport/UploadPackLoggerChain;->loggers:[Lorg/eclipse/jgit/transport/UploadPackLogger;

    .line 91
    iput p2, p0, Lorg/eclipse/jgit/transport/UploadPackLoggerChain;->count:I

    .line 92
    return-void
.end method

.method public static newChain(Ljava/util/List;)Lorg/eclipse/jgit/transport/UploadPackLogger;
    .locals 6
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<+",
            "Lorg/eclipse/jgit/transport/UploadPackLogger;",
            ">;)",
            "Lorg/eclipse/jgit/transport/UploadPackLogger;"
        }
    .end annotation

    .prologue
    .line 68
    .local p0, loggers:Ljava/util/List;,"Ljava/util/List<+Lorg/eclipse/jgit/transport/UploadPackLogger;>;"
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v5

    new-array v4, v5, [Lorg/eclipse/jgit/transport/UploadPackLogger;

    .line 69
    .local v4, newLoggers:[Lorg/eclipse/jgit/transport/UploadPackLogger;
    const/4 v0, 0x0

    .line 70
    .local v0, i:I
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/transport/UploadPackLogger;

    .line 71
    .local v3, logger:Lorg/eclipse/jgit/transport/UploadPackLogger;
    sget-object v5, Lorg/eclipse/jgit/transport/UploadPackLogger;->NULL:Lorg/eclipse/jgit/transport/UploadPackLogger;

    if-eq v3, v5, :cond_0

    .line 72
    add-int/lit8 v1, v0, 0x1

    .end local v0           #i:I
    .local v1, i:I
    aput-object v3, v4, v0

    move v0, v1

    .end local v1           #i:I
    .restart local v0       #i:I
    goto :goto_0

    .line 73
    .end local v3           #logger:Lorg/eclipse/jgit/transport/UploadPackLogger;
    :cond_1
    if-nez v0, :cond_2

    .line 74
    sget-object v5, Lorg/eclipse/jgit/transport/UploadPackLogger;->NULL:Lorg/eclipse/jgit/transport/UploadPackLogger;

    .line 78
    :goto_1
    return-object v5

    .line 75
    :cond_2
    const/4 v5, 0x1

    if-ne v0, v5, :cond_3

    .line 76
    const/4 v5, 0x0

    aget-object v5, v4, v5

    goto :goto_1

    .line 78
    :cond_3
    new-instance v5, Lorg/eclipse/jgit/transport/UploadPackLoggerChain;

    invoke-direct {v5, v4, v0}, Lorg/eclipse/jgit/transport/UploadPackLoggerChain;-><init>([Lorg/eclipse/jgit/transport/UploadPackLogger;I)V

    goto :goto_1
.end method


# virtual methods
.method public onPackStatistics(Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;)V
    .locals 2
    .parameter "stats"

    .prologue
    .line 85
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v1, p0, Lorg/eclipse/jgit/transport/UploadPackLoggerChain;->count:I

    if-ge v0, v1, :cond_0

    .line 86
    iget-object v1, p0, Lorg/eclipse/jgit/transport/UploadPackLoggerChain;->loggers:[Lorg/eclipse/jgit/transport/UploadPackLogger;

    aget-object v1, v1, v0

    invoke-interface {v1, p1}, Lorg/eclipse/jgit/transport/UploadPackLogger;->onPackStatistics(Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;)V

    .line 85
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 87
    :cond_0
    return-void
.end method
