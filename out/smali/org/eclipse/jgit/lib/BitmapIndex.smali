.class public interface abstract Lorg/eclipse/jgit/lib/BitmapIndex;
.super Ljava/lang/Object;
.source "BitmapIndex.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;,
        Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;
    }
.end annotation


# virtual methods
.method public abstract getBitmap(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/BitmapIndex$Bitmap;
.end method

.method public abstract newBitmapBuilder()Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;
.end method
