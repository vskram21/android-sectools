.class final Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseNonTag;
.super Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledNonTag;
.source "RefDirectory.java"

# interfaces
.implements Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/RefDirectory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "LooseNonTag"
.end annotation


# instance fields
.field private final snapShot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 1
    .parameter "snapshot"
    .parameter "refName"
    .parameter "id"

    .prologue
    .line 1076
    sget-object v0, Lorg/eclipse/jgit/lib/Ref$Storage;->LOOSE:Lorg/eclipse/jgit/lib/Ref$Storage;

    invoke-direct {p0, v0, p2, p3}, Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledNonTag;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 1077
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseNonTag;->snapShot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    .line 1078
    return-void
.end method


# virtual methods
.method public getSnapShot()Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;
    .locals 1

    .prologue
    .line 1081
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseNonTag;->snapShot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    return-object v0
.end method

.method public peel(Lorg/eclipse/jgit/lib/ObjectIdRef;)Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;
    .locals 0
    .parameter "newLeaf"

    .prologue
    .line 1085
    return-object p0
.end method
