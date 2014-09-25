.class public interface abstract Lorg/eclipse/jgit/lib/Ref;
.super Ljava/lang/Object;
.source "Ref.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/lib/Ref$Storage;
    }
.end annotation


# virtual methods
.method public abstract getLeaf()Lorg/eclipse/jgit/lib/Ref;
.end method

.method public abstract getName()Ljava/lang/String;
.end method

.method public abstract getObjectId()Lorg/eclipse/jgit/lib/ObjectId;
.end method

.method public abstract getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;
.end method

.method public abstract getStorage()Lorg/eclipse/jgit/lib/Ref$Storage;
.end method

.method public abstract getTarget()Lorg/eclipse/jgit/lib/Ref;
.end method

.method public abstract isPeeled()Z
.end method

.method public abstract isSymbolic()Z
.end method
