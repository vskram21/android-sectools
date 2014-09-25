.class final Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;
.super Ljava/lang/Object;
.source "DfsBlockCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "HashEntry"
.end annotation


# instance fields
.field final next:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;

.field final ref:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;)V
    .locals 0
    .parameter "n"
    .parameter "r"

    .prologue
    .line 532
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 533
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;->next:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;

    .line 534
    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$HashEntry;->ref:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache$Ref;

    .line 535
    return-void
.end method
