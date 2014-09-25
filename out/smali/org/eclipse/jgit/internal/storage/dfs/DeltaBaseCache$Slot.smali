.class Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;
.super Ljava/lang/Object;
.source "DeltaBaseCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Slot"
.end annotation


# instance fields
.field data:Ljava/lang/ref/SoftReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/SoftReference",
            "<",
            "Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Entry;",
            ">;"
        }
    .end annotation
.end field

.field lruNext:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

.field lruPrev:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;

.field final offset:J

.field final pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

.field final size:I

.field tableNext:Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;JI)V
    .locals 0
    .parameter "key"
    .parameter "offset"
    .parameter "size"

    .prologue
    .line 188
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 189
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;->pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;

    .line 190
    iput-wide p2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;->offset:J

    .line 191
    iput p4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DeltaBaseCache$Slot;->size:I

    .line 192
    return-void
.end method
