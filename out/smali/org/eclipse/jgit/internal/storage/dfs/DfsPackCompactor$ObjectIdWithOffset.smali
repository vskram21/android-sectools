.class Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$ObjectIdWithOffset;
.super Lorg/eclipse/jgit/lib/ObjectId;
.source "DfsPackCompactor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ObjectIdWithOffset"
.end annotation


# instance fields
.field final offset:J


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/lib/AnyObjectId;J)V
    .locals 0
    .parameter "id"
    .parameter "ofs"

    .prologue
    .line 394
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/lib/ObjectId;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 395
    iput-wide p2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$ObjectIdWithOffset;->offset:J

    .line 396
    return-void
.end method
