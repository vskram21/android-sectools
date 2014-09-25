.class public abstract Lorg/eclipse/jgit/transport/CredentialItem;
.super Ljava/lang/Object;
.source "CredentialItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/transport/CredentialItem$CharArrayType;,
        Lorg/eclipse/jgit/transport/CredentialItem$InformationalMessage;,
        Lorg/eclipse/jgit/transport/CredentialItem$Password;,
        Lorg/eclipse/jgit/transport/CredentialItem$StringType;,
        Lorg/eclipse/jgit/transport/CredentialItem$Username;,
        Lorg/eclipse/jgit/transport/CredentialItem$YesNoType;
    }
.end annotation


# instance fields
.field private final promptText:Ljava/lang/String;

.field private final valueSecure:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 0
    .parameter "promptText"
    .parameter "maskValue"

    .prologue
    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    iput-object p1, p0, Lorg/eclipse/jgit/transport/CredentialItem;->promptText:Ljava/lang/String;

    .line 83
    iput-boolean p2, p0, Lorg/eclipse/jgit/transport/CredentialItem;->valueSecure:Z

    .line 84
    return-void
.end method


# virtual methods
.method public abstract clear()V
.end method

.method public getPromptText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lorg/eclipse/jgit/transport/CredentialItem;->promptText:Ljava/lang/String;

    return-object v0
.end method

.method public isValueSecure()Z
    .locals 1

    .prologue
    .line 93
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/CredentialItem;->valueSecure:Z

    return v0
.end method
