.class final Lcom/googlecode/javaewah/FastAggregation$7;
.super Ljava/lang/Object;
.source "FastAggregation.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/googlecode/javaewah/FastAggregation;->legacy_orWithContainer(Lcom/googlecode/javaewah/BitmapStorage;[Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V
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
    .line 317
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lcom/googlecode/javaewah/EWAHCompressedBitmap;)I
    .locals 2
    .parameter "a"
    .parameter "b"

    .prologue
    .line 320
    iget v0, p1, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    iget v1, p2, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    iget v0, p1, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    iget v1, p2, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->sizeinbits:I

    if-ne v0, v1, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    const/4 v0, -0x1

    goto :goto_0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 317
    check-cast p1, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .end local p1
    check-cast p2, Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lcom/googlecode/javaewah/FastAggregation$7;->compare(Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lcom/googlecode/javaewah/EWAHCompressedBitmap;)I

    move-result v0

    return v0
.end method
