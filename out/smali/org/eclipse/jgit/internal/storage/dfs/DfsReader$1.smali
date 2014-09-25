.class final Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$1;
.super Ljava/lang/Object;
.source "DfsReader.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject",
        "<*>;>;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 228
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 228
    check-cast p1, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;

    .end local p1
    check-cast p2, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$1;->compare(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;)I
    .locals 5
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject",
            "<*>;",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject",
            "<*>;)I"
        }
    .end annotation

    .prologue
    .line 230
    .local p1, a:Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject<*>;"
    .local p2, b:Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject<*>;"
    iget v1, p1, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;->packIndex:I

    iget v2, p2, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;->packIndex:I

    sub-int v0, v1, v2

    .line 231
    .local v0, cmp:I
    if-nez v0, :cond_0

    .line 232
    iget-wide v1, p1, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;->offset:J

    iget-wide v3, p2, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;->offset:J

    sub-long/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/Long;->signum(J)I

    move-result v0

    .line 233
    :cond_0
    return v0
.end method
