.class public Lcom/googlecode/javaewah/NonEmptyVirtualStorage;
.super Ljava/lang/Object;
.source "NonEmptyVirtualStorage.java"

# interfaces
.implements Lcom/googlecode/javaewah/BitmapStorage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/googlecode/javaewah/NonEmptyVirtualStorage$NonEmptyException;
    }
.end annotation


# static fields
.field private static final nonEmptyException:Lcom/googlecode/javaewah/NonEmptyVirtualStorage$NonEmptyException;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    new-instance v0, Lcom/googlecode/javaewah/NonEmptyVirtualStorage$NonEmptyException;

    invoke-direct {v0}, Lcom/googlecode/javaewah/NonEmptyVirtualStorage$NonEmptyException;-><init>()V

    sput-object v0, Lcom/googlecode/javaewah/NonEmptyVirtualStorage;->nonEmptyException:Lcom/googlecode/javaewah/NonEmptyVirtualStorage$NonEmptyException;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    return-void
.end method


# virtual methods
.method public add(J)V
    .locals 2
    .parameter "newdata"

    .prologue
    .line 43
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-eqz v0, :cond_0

    .line 44
    sget-object v0, Lcom/googlecode/javaewah/NonEmptyVirtualStorage;->nonEmptyException:Lcom/googlecode/javaewah/NonEmptyVirtualStorage$NonEmptyException;

    throw v0

    .line 45
    :cond_0
    return-void
.end method

.method public addStreamOfEmptyWords(ZJ)V
    .locals 2
    .parameter "v"
    .parameter "number"

    .prologue
    .line 67
    if-eqz p1, :cond_0

    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-lez v0, :cond_0

    .line 68
    sget-object v0, Lcom/googlecode/javaewah/NonEmptyVirtualStorage;->nonEmptyException:Lcom/googlecode/javaewah/NonEmptyVirtualStorage$NonEmptyException;

    throw v0

    .line 69
    :cond_0
    return-void
.end method

.method public addStreamOfLiteralWords([JII)V
    .locals 1
    .parameter "data"
    .parameter "start"
    .parameter "number"

    .prologue
    .line 54
    if-lez p3, :cond_0

    .line 55
    sget-object v0, Lcom/googlecode/javaewah/NonEmptyVirtualStorage;->nonEmptyException:Lcom/googlecode/javaewah/NonEmptyVirtualStorage$NonEmptyException;

    throw v0

    .line 57
    :cond_0
    return-void
.end method

.method public addStreamOfNegatedLiteralWords([JII)V
    .locals 1
    .parameter "data"
    .parameter "start"
    .parameter "number"

    .prologue
    .line 78
    if-lez p3, :cond_0

    .line 79
    sget-object v0, Lcom/googlecode/javaewah/NonEmptyVirtualStorage;->nonEmptyException:Lcom/googlecode/javaewah/NonEmptyVirtualStorage$NonEmptyException;

    throw v0

    .line 81
    :cond_0
    return-void
.end method

.method public setSizeInBits(I)V
    .locals 0
    .parameter "bits"

    .prologue
    .line 90
    return-void
.end method
