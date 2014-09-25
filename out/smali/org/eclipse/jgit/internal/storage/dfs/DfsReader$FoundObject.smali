.class Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;
.super Ljava/lang/Object;
.source "DfsReader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FoundObject"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lorg/eclipse/jgit/lib/ObjectId;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field final id:Lorg/eclipse/jgit/lib/ObjectId;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field final offset:J

.field final pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

.field final packIndex:I


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 250
    .local p0, this:Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject<TT;>;"
    .local p1, objectId:Lorg/eclipse/jgit/lib/ObjectId;,"TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 251
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;->id:Lorg/eclipse/jgit/lib/ObjectId;

    .line 252
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;->pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    .line 253
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;->offset:J

    .line 254
    const/4 v0, 0x0

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;->packIndex:I

    .line 255
    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/lib/ObjectId;ILorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;J)V
    .locals 0
    .parameter
    .parameter "packIdx"
    .parameter "pack"
    .parameter "offset"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;",
            "J)V"
        }
    .end annotation

    .prologue
    .line 243
    .local p0, this:Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject<TT;>;"
    .local p1, objectId:Lorg/eclipse/jgit/lib/ObjectId;,"TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 244
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;->id:Lorg/eclipse/jgit/lib/ObjectId;

    .line 245
    iput-object p3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;->pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    .line 246
    iput-wide p4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;->offset:J

    .line 247
    iput p2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader$FoundObject;->packIndex:I

    .line 248
    return-void
.end method
