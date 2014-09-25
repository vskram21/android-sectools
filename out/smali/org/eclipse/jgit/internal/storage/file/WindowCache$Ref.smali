.class Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;
.super Ljava/lang/ref/SoftReference;
.source "WindowCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/WindowCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Ref"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ref/SoftReference",
        "<",
        "Lorg/eclipse/jgit/internal/storage/file/ByteWindow;",
        ">;"
    }
.end annotation


# instance fields
.field private cleared:Z

.field lastAccess:J

.field final pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;

.field final position:J

.field final size:I


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/internal/storage/file/PackFile;JLorg/eclipse/jgit/internal/storage/file/ByteWindow;Ljava/lang/ref/ReferenceQueue;)V
    .locals 1
    .parameter "pack"
    .parameter "position"
    .parameter "v"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/internal/storage/file/PackFile;",
            "J",
            "Lorg/eclipse/jgit/internal/storage/file/ByteWindow;",
            "Ljava/lang/ref/ReferenceQueue",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/ByteWindow;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 588
    .local p5, queue:Ljava/lang/ref/ReferenceQueue;,"Ljava/lang/ref/ReferenceQueue<Lorg/eclipse/jgit/internal/storage/file/ByteWindow;>;"
    invoke-direct {p0, p4, p5}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    .line 589
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;->pack:Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .line 590
    iput-wide p2, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;->position:J

    .line 591
    invoke-virtual {p4}, Lorg/eclipse/jgit/internal/storage/file/ByteWindow;->size()I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;->size:I

    .line 592
    return-void
.end method


# virtual methods
.method final declared-synchronized canClear()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 595
    monitor-enter p0

    :try_start_0
    iget-boolean v1, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;->cleared:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    .line 596
    const/4 v0, 0x0

    .line 598
    :goto_0
    monitor-exit p0

    return v0

    .line 597
    :cond_0
    const/4 v1, 0x1

    :try_start_1
    iput-boolean v1, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;->cleared:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 595
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
