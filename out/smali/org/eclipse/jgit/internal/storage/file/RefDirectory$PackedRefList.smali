.class Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;
.super Lorg/eclipse/jgit/util/RefList;
.source "RefDirectory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/RefDirectory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PackedRefList"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/util/RefList",
        "<",
        "Lorg/eclipse/jgit/lib/Ref;",
        ">;"
    }
.end annotation


# static fields
.field static final NO_PACKED_REFS:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;


# instance fields
.field final id:Lorg/eclipse/jgit/lib/ObjectId;

.field final snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 1025
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;

    invoke-static {}, Lorg/eclipse/jgit/util/RefList;->emptyList()Lorg/eclipse/jgit/util/RefList;

    move-result-object v1

    sget-object v2, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->MISSING_FILE:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;-><init>(Lorg/eclipse/jgit/util/RefList;Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;Lorg/eclipse/jgit/lib/ObjectId;)V

    sput-object v0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;->NO_PACKED_REFS:Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;

    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/util/RefList;Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 0
    .parameter
    .parameter "s"
    .parameter "i"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/util/RefList",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;",
            "Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1034
    .local p1, src:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/util/RefList;-><init>(Lorg/eclipse/jgit/util/RefList;)V

    .line 1035
    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;->snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    .line 1036
    iput-object p3, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$PackedRefList;->id:Lorg/eclipse/jgit/lib/ObjectId;

    .line 1037
    return-void
.end method
