.class public interface abstract Lorg/eclipse/jgit/lib/ReflogEntry;
.super Ljava/lang/Object;
.source "ReflogEntry.java"


# virtual methods
.method public abstract getComment()Ljava/lang/String;
.end method

.method public abstract getNewId()Lorg/eclipse/jgit/lib/ObjectId;
.end method

.method public abstract getOldId()Lorg/eclipse/jgit/lib/ObjectId;
.end method

.method public abstract getWho()Lorg/eclipse/jgit/lib/PersonIdent;
.end method

.method public abstract parseCheckout()Lorg/eclipse/jgit/lib/CheckoutEntry;
.end method
