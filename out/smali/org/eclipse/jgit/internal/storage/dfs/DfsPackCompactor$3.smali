.class Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$3;
.super Ljava/lang/Object;
.source "DfsPackCompactor.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->toInclude(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$ObjectIdWithOffset;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;)V
    .locals 0
    .parameter

    .prologue
    .line 355
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$3;->this$0:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 355
    check-cast p1, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$ObjectIdWithOffset;

    .end local p1
    check-cast p2, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$ObjectIdWithOffset;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$3;->compare(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$ObjectIdWithOffset;Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$ObjectIdWithOffset;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$ObjectIdWithOffset;Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$ObjectIdWithOffset;)I
    .locals 4
    .parameter "a"
    .parameter "b"

    .prologue
    .line 357
    iget-wide v0, p1, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$ObjectIdWithOffset;->offset:J

    iget-wide v2, p2, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$ObjectIdWithOffset;->offset:J

    sub-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Long;->signum(J)I

    move-result v0

    return v0
.end method
