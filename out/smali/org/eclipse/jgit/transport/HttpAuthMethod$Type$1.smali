.class final enum Lorg/eclipse/jgit/transport/HttpAuthMethod$Type$1;
.super Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;
.source "HttpAuthMethod.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4008
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 83
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;-><init>(Ljava/lang/String;ILorg/eclipse/jgit/transport/HttpAuthMethod$1;)V

    return-void
.end method


# virtual methods
.method public getSchemeName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 91
    const-string v0, "None"

    return-object v0
.end method

.method public method(Ljava/lang/String;)Lorg/eclipse/jgit/transport/HttpAuthMethod;
    .locals 1
    .parameter "hdr"

    .prologue
    .line 86
    sget-object v0, Lorg/eclipse/jgit/transport/HttpAuthMethod$None;->INSTANCE:Lorg/eclipse/jgit/transport/HttpAuthMethod$None;

    return-object v0
.end method
