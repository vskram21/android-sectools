.class public Lorg/eclipse/jgit/transport/CredentialItem$StringType;
.super Lorg/eclipse/jgit/transport/CredentialItem;
.source "CredentialItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/CredentialItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "StringType"
.end annotation


# instance fields
.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 0
    .parameter "promptText"
    .parameter "maskValue"

    .prologue
    .line 122
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/transport/CredentialItem;-><init>(Ljava/lang/String;Z)V

    .line 123
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 127
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/CredentialItem$StringType;->value:Ljava/lang/String;

    .line 128
    return-void
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 132
    iget-object v0, p0, Lorg/eclipse/jgit/transport/CredentialItem$StringType;->value:Ljava/lang/String;

    return-object v0
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 0
    .parameter "newValue"

    .prologue
    .line 140
    iput-object p1, p0, Lorg/eclipse/jgit/transport/CredentialItem$StringType;->value:Ljava/lang/String;

    .line 141
    return-void
.end method
