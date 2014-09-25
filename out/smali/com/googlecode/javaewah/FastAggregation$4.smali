.class final Lcom/googlecode/javaewah/FastAggregation$4;
.super Ljava/lang/Object;
.source "FastAggregation.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/googlecode/javaewah/FastAggregation;->orToContainer(Lcom/googlecode/javaewah/BitmapStorage;[Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/googlecode/javaewah/EWAHCompressedBitmap;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 224
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lcom/googlecode/javaewah/EWAHCompressedBitmap;)I
    .locals 2
    .parameter "a"
    .parameter "b"

    .prologue
    .line 227
    invoke-virtual {p1}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeInBytes()I

    move-result v0

    invoke-virtual {p2}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeInBytes()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 224
    check-cast p1, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .end local p1
    check-cast p2, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lcom/googlecode/javaewah/FastAggregation$4;->compare(Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lcom/googlecode/javaewah/EWAHCompressedBitmap;)I

    move-result v0

    return v0
.end method
