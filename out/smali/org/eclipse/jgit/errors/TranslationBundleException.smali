.class public abstract Lorg/eclipse/jgit/errors/TranslationBundleException;
.super Ljava/lang/RuntimeException;
.source "TranslationBundleException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final bundleClass:Ljava/lang/Class;

.field private final locale:Ljava/util/Locale;


# direct methods
.method protected constructor <init>(Ljava/lang/String;Ljava/lang/Class;Ljava/util/Locale;Ljava/lang/Exception;)V
    .locals 0
    .parameter "message"
    .parameter "bundleClass"
    .parameter "locale"
    .parameter "cause"

    .prologue
    .line 71
    invoke-direct {p0, p1, p4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 72
    iput-object p2, p0, Lorg/eclipse/jgit/errors/TranslationBundleException;->bundleClass:Ljava/lang/Class;

    .line 73
    iput-object p3, p0, Lorg/eclipse/jgit/errors/TranslationBundleException;->locale:Ljava/util/Locale;

    .line 74
    return-void
.end method


# virtual methods
.method public final getBundleClass()Ljava/lang/Class;
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lorg/eclipse/jgit/errors/TranslationBundleException;->bundleClass:Ljava/lang/Class;

    return-object v0
.end method

.method public final getLocale()Ljava/util/Locale;
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lorg/eclipse/jgit/errors/TranslationBundleException;->locale:Ljava/util/Locale;

    return-object v0
.end method
