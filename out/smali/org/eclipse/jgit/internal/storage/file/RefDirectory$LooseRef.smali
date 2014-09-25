.class interface abstract Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;
.super Ljava/lang/Object;
.source "RefDirectory.java"

# interfaces
.implements Lorg/eclipse/jgit/lib/Ref;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/RefDirectory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x60a
    name = "LooseRef"
.end annotation


# virtual methods
.method public abstract getSnapShot()Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;
.end method

.method public abstract peel(Lorg/eclipse/jgit/lib/ObjectIdRef;)Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;
.end method
