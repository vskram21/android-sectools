.class final Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;
.super Ljava/lang/Object;
.source "DfsBlockCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Ref"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field volatile hot:Z

.field next:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

.field final pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

.field final position:J

.field final size:I

.field volatile value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;JILjava/lang/Object;)V
    .locals 0
    .parameter "pack"
    .parameter "position"
    .parameter "size"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;",
            "JITT;)V"
        }
    .end annotation

    .prologue
    .line 546
    .local p0, this:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref<TT;>;"
    .local p5, v:Ljava/lang/Object;,"TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 547
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    .line 548
    iput-wide p2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->position:J

    .line 549
    iput p4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->size:I

    .line 550
    iput-object p5, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->value:Ljava/lang/Object;

    .line 551
    return-void
.end method


# virtual methods
.method get()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 554
    .local p0, this:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref<TT;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->value:Ljava/lang/Object;

    .line 555
    .local v0, v:Ljava/lang/Object;,"TT;"
    if-eqz v0, :cond_0

    .line 556
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->hot:Z

    .line 557
    :cond_0
    return-object v0
.end method

.method has()Z
    .locals 1

    .prologue
    .line 561
    .local p0, this:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref<TT;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;->value:Ljava/lang/Object;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
