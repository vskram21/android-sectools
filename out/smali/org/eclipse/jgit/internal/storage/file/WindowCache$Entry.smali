.class Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;
.super Ljava/lang/Object;
.source "WindowCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/WindowCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Entry"
.end annotation


# instance fields
.field volatile dead:Z

.field final next:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;

.field final ref:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;)V
    .locals 0
    .parameter "n"
    .parameter "r"

    .prologue
    .line 563
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 564
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;->next:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;

    .line 565
    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;->ref:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;

    .line 566
    return-void
.end method


# virtual methods
.method final kill()V
    .locals 1

    .prologue
    .line 569
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;->dead:Z

    .line 570
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Entry;->ref:Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/WindowCache$Ref;->enqueue()Z

    .line 571
    return-void
.end method
