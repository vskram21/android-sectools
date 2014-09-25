.class Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$2;
.super Ljava/lang/Object;
.source "DfsPackCompactor.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->addObjectsToPack(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;Lorg/eclipse/jgit/lib/ProgressMonitor;)V
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
        "Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;",
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
    .line 290
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$2;->this$0:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 290
    check-cast p1, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    .end local p1
    check-cast p2, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$2;->compare(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;)I
    .locals 2
    .parameter "a"
    .parameter "b"

    .prologue
    .line 292
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getPackDescription()Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    move-result-object v0

    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getPackDescription()Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->compareTo(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;)I

    move-result v0

    return v0
.end method
