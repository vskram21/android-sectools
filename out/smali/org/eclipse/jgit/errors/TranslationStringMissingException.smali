.class public Lorg/eclipse/jgit/errors/TranslationStringMissingException;
.super Lorg/eclipse/jgit/errors/TranslationBundleException;
.source "TranslationStringMissingException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final key:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/Class;Ljava/util/Locale;Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 2
    .parameter "bundleClass"
    .parameter "locale"
    .parameter "key"
    .parameter "cause"

    .prologue
    .line 72
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Translation missing for ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p2}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p1, p2, p4}, Lorg/eclipse/jgit/errors/TranslationBundleException;-><init>(Ljava/lang/String;Ljava/lang/Class;Ljava/util/Locale;Ljava/lang/Exception;)V

    .line 75
    iput-object p3, p0, Lorg/eclipse/jgit/errors/TranslationStringMissingException;->key:Ljava/lang/String;

    .line 76
    return-void
.end method


# virtual methods
.method public getKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lorg/eclipse/jgit/errors/TranslationStringMissingException;->key:Ljava/lang/String;

    return-object v0
.end method
