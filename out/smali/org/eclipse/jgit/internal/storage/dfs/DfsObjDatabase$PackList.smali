.class final Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;
.super Ljava/lang/Object;
.source "DfsObjDatabase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "PackList"
.end annotation


# instance fields
.field final packs:[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;


# direct methods
.method constructor <init>([Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;)V
    .locals 0
    .parameter "packs"

    .prologue
    .line 430
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 431
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;->packs:[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    .line 432
    return-void
.end method
