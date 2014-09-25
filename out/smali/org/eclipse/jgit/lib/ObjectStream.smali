.class public abstract Lorg/eclipse/jgit/lib/ObjectStream;
.super Ljava/io/InputStream;
.source "ObjectStream.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/lib/ObjectStream$Filter;,
        Lorg/eclipse/jgit/lib/ObjectStream$SmallStream;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 157
    return-void
.end method


# virtual methods
.method public abstract getSize()J
.end method

.method public abstract getType()I
.end method
