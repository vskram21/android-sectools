.class final Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseSymbolicRef;
.super Lorg/eclipse/jgit/lib/SymbolicRef;
.source "RefDirectory.java"

# interfaces
.implements Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/RefDirectory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "LooseSymbolicRef"
.end annotation


# instance fields
.field private final snapShot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;)V
    .locals 0
    .parameter "snapshot"
    .parameter "refName"
    .parameter "target"

    .prologue
    .line 1117
    invoke-direct {p0, p2, p3}, Lorg/eclipse/jgit/lib/SymbolicRef;-><init>(Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;)V

    .line 1118
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseSymbolicRef;->snapShot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    .line 1119
    return-void
.end method


# virtual methods
.method public getSnapShot()Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;
    .locals 1

    .prologue
    .line 1122
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseSymbolicRef;->snapShot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    return-object v0
.end method

.method public peel(Lorg/eclipse/jgit/lib/ObjectIdRef;)Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;
    .locals 1
    .parameter "newLeaf"

    .prologue
    .line 1127
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
