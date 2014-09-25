.class public interface abstract Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;
.super Ljava/lang/Object;
.source "BitmapIndex.java"

# interfaces
.implements Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/lib/BitmapIndex;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "BitmapBuilder"
.end annotation


# virtual methods
.method public abstract add(Lorg/eclipse/jgit/lib/AnyObjectId;I)Z
.end method

.method public abstract andNot(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;
.end method

.method public abstract build()Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;
.end method

.method public abstract cardinality()I
.end method

.method public abstract contains(Lorg/eclipse/jgit/lib/AnyObjectId;)Z
.end method

.method public abstract or(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;
.end method

.method public abstract remove(Lorg/eclipse/jgit/lib/AnyObjectId;)V
.end method

.method public abstract removeAllOrNone(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;)Z
.end method

.method public abstract xor(Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;)Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;
.end method
