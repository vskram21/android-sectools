.class final Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$4;
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
        "Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 446
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 446
    check-cast p1, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;

    .end local p1
    check-cast p2, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$4;->compare(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;)I
    .locals 4
    .parameter "a"
    .parameter "b"

    .prologue
    .line 448
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;->getOffset()J

    move-result-wide v0

    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectToPack;->getOffset()J

    move-result-wide v2

    sub-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Long;->signum(J)I

    move-result v0

    return v0
.end method
