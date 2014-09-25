.class Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;
.super Ljava/lang/Object;
.source "DfsPackFile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Delta"
.end annotation


# instance fields
.field final basePos:J

.field final deltaPos:J

.field final deltaSize:I

.field final hdrLen:I

.field final next:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;JIIJ)V
    .locals 0
    .parameter "next"
    .parameter "ofs"
    .parameter "sz"
    .parameter "hdrLen"
    .parameter "baseOffset"

    .prologue
    .line 913
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 914
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;->next:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;

    .line 915
    iput-wide p2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;->deltaPos:J

    .line 916
    iput p4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;->deltaSize:I

    .line 917
    iput p5, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;->hdrLen:I

    .line 918
    iput-wide p6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile$Delta;->basePos:J

    .line 919
    return-void
.end method
