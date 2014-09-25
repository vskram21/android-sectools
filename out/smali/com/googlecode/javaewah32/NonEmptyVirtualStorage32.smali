.class public Lcom/googlecode/javaewah32/NonEmptyVirtualStorage32;
.super Ljava/lang/Object;
.source "NonEmptyVirtualStorage32.java"

# interfaces
.implements Lcom/googlecode/javaewah32/BitmapStorage32;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/googlecode/javaewah32/NonEmptyVirtualStorage32$NonEmptyException;
    }
.end annotation


# static fields
.field private static final nonEmptyException:Lcom/googlecode/javaewah32/NonEmptyVirtualStorage32$NonEmptyException;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    new-instance v0, Lcom/googlecode/javaewah32/NonEmptyVirtualStorage32$NonEmptyException;

    invoke-direct {v0}, Lcom/googlecode/javaewah32/NonEmptyVirtualStorage32$NonEmptyException;-><init>()V

    sput-object v0, Lcom/googlecode/javaewah32/NonEmptyVirtualStorage32;->nonEmptyException:Lcom/googlecode/javaewah32/NonEmptyVirtualStorage32$NonEmptyException;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    return-void
.end method


# virtual methods
.method public add(I)V
    .locals 1
    .parameter "newdata"

    .prologue
    .line 43
    if-eqz p1, :cond_0

    sget-object v0, Lcom/googlecode/javaewah32/NonEmptyVirtualStorage32;->nonEmptyException:Lcom/googlecode/javaewah32/NonEmptyVirtualStorage32$NonEmptyException;

    throw v0

    .line 44
    :cond_0
    return-void
.end method

.method public addStreamOfEmptyWords(ZI)V
    .locals 1
    .parameter "v"
    .parameter "number"

    .prologue
    .line 64
    if-eqz p1, :cond_0

    if-lez p2, :cond_0

    sget-object v0, Lcom/googlecode/javaewah32/NonEmptyVirtualStorage32;->nonEmptyException:Lcom/googlecode/javaewah32/NonEmptyVirtualStorage32$NonEmptyException;

    throw v0

    .line 65
    :cond_0
    return-void
.end method

.method public addStreamOfLiteralWords([III)V
    .locals 1
    .parameter "data"
    .parameter "start"
    .parameter "number"

    .prologue
    .line 52
    if-lez p3, :cond_0

    .line 53
    sget-object v0, Lcom/googlecode/javaewah32/NonEmptyVirtualStorage32;->nonEmptyException:Lcom/googlecode/javaewah32/NonEmptyVirtualStorage32$NonEmptyException;

    throw v0

    .line 55
    :cond_0
    return-void
.end method

.method public addStreamOfNegatedLiteralWords([III)V
    .locals 1
    .parameter "data"
    .parameter "start"
    .parameter "number"

    .prologue
    .line 73
    if-lez p3, :cond_0

    .line 74
    sget-object v0, Lcom/googlecode/javaewah32/NonEmptyVirtualStorage32;->nonEmptyException:Lcom/googlecode/javaewah32/NonEmptyVirtualStorage32$NonEmptyException;

    throw v0

    .line 76
    :cond_0
    return-void
.end method

.method public setSizeInBits(I)V
    .locals 0
    .parameter "bits"

    .prologue
    .line 85
    return-void
.end method
