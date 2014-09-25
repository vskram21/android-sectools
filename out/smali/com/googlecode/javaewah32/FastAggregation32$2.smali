.class final Lcom/googlecode/javaewah32/FastAggregation32$2;
.super Ljava/lang/Object;
.source "FastAggregation32.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/googlecode/javaewah32/FastAggregation32;->bufferedxorWithContainer(Lcom/googlecode/javaewah32/BitmapStorage32;I[Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)V
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
        "Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 152
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)I
    .locals 2
    .parameter "a"
    .parameter "b"

    .prologue
    .line 155
    iget v0, p2, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    iget v1, p1, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->sizeinbits:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 152
    check-cast p1, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    .end local p1
    check-cast p2, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lcom/googlecode/javaewah32/FastAggregation32$2;->compare(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)I

    move-result v0

    return v0
.end method
