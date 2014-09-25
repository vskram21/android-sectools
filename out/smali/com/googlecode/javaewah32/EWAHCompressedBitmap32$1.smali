.class Lcom/googlecode/javaewah32/EWAHCompressedBitmap32$1;
.super Ljava/lang/Object;
.source "EWAHCompressedBitmap32.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

.field private final under:Lcom/googlecode/javaewah/IntIterator;


# direct methods
.method constructor <init>(Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;)V
    .locals 1
    .parameter

    .prologue
    .line 714
    iput-object p1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32$1;->this$0:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 730
    iget-object v0, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32$1;->this$0:Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;

    invoke-virtual {v0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32;->intIterator()Lcom/googlecode/javaewah/IntIterator;

    move-result-object v0

    iput-object v0, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32$1;->under:Lcom/googlecode/javaewah/IntIterator;

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .prologue
    .line 717
    iget-object v0, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32$1;->under:Lcom/googlecode/javaewah/IntIterator;

    invoke-interface {v0}, Lcom/googlecode/javaewah/IntIterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public next()Ljava/lang/Integer;
    .locals 2

    .prologue
    .line 722
    new-instance v0, Ljava/lang/Integer;

    iget-object v1, p0, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32$1;->under:Lcom/googlecode/javaewah/IntIterator;

    invoke-interface {v1}, Lcom/googlecode/javaewah/IntIterator;->next()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    return-object v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 714
    invoke-virtual {p0}, Lcom/googlecode/javaewah32/EWAHCompressedBitmap32$1;->next()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 2

    .prologue
    .line 727
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "bitsets do not support remove"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
