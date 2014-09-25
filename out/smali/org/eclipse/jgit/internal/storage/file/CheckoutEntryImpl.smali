.class public Lorg/eclipse/jgit/internal/storage/file/CheckoutEntryImpl;
.super Ljava/lang/Object;
.source "CheckoutEntryImpl.java"

# interfaces
.implements Lorg/eclipse/jgit/lib/CheckoutEntry;


# static fields
.field static final CHECKOUT_MOVING_FROM:Ljava/lang/String; = "checkout: moving from "


# instance fields
.field private from:Ljava/lang/String;

.field private to:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/lib/ReflogEntry;)V
    .locals 5
    .parameter "reflogEntry"

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/ReflogEntry;->getComment()Ljava/lang/String;

    move-result-object v0

    .line 61
    .local v0, comment:Ljava/lang/String;
    const-string v4, "checkout: moving from "

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v1

    .line 62
    .local v1, p1:I
    const-string v4, " to "

    invoke-virtual {v0, v4, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    .line 63
    .local v2, p2:I
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    .line 64
    .local v3, p3:I
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/CheckoutEntryImpl;->from:Ljava/lang/String;

    .line 65
    const-string v4, " to "

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v4, v2

    invoke-virtual {v0, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/CheckoutEntryImpl;->to:Ljava/lang/String;

    .line 66
    return-void
.end method


# virtual methods
.method public getFromBranch()Ljava/lang/String;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/CheckoutEntryImpl;->from:Ljava/lang/String;

    return-object v0
.end method

.method public getToBranch()Ljava/lang/String;
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/CheckoutEntryImpl;->to:Ljava/lang/String;

    return-object v0
.end method
