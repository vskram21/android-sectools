.class public abstract Lorg/eclipse/jgit/nls/TranslationBundle;
.super Ljava/lang/Object;
.source "TranslationBundle.java"


# instance fields
.field private effectiveLocale:Ljava/util/Locale;

.field private resourceBundle:Ljava/util/ResourceBundle;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public effectiveLocale()Ljava/util/Locale;
    .locals 1

    .prologue
    .line 132
    iget-object v0, p0, Lorg/eclipse/jgit/nls/TranslationBundle;->effectiveLocale:Ljava/util/Locale;

    return-object v0
.end method

.method load(Ljava/util/Locale;)V
    .locals 9
    .parameter "locale"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TranslationBundleLoadingException;
        }
    .end annotation

    .prologue
    .line 160
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 162
    .local v1, bundleClass:Ljava/lang/Class;
    :try_start_0
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7, p1}, Ljava/util/ResourceBundle;->getBundle(Ljava/lang/String;Ljava/util/Locale;)Ljava/util/ResourceBundle;

    move-result-object v7

    iput-object v7, p0, Lorg/eclipse/jgit/nls/TranslationBundle;->resourceBundle:Ljava/util/ResourceBundle;
    :try_end_0
    .catch Ljava/util/MissingResourceException; {:try_start_0 .. :try_end_0} :catch_0

    .line 166
    iget-object v7, p0, Lorg/eclipse/jgit/nls/TranslationBundle;->resourceBundle:Ljava/util/ResourceBundle;

    invoke-virtual {v7}, Ljava/util/ResourceBundle;->getLocale()Ljava/util/Locale;

    move-result-object v7

    iput-object v7, p0, Lorg/eclipse/jgit/nls/TranslationBundle;->effectiveLocale:Ljava/util/Locale;

    .line 168
    invoke-virtual {v1}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v0

    .local v0, arr$:[Ljava/lang/reflect/Field;
    array-length v5, v0

    .local v5, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_0
    if-ge v4, v5, :cond_1

    aget-object v3, v0, v4

    .line 169
    .local v3, field:Ljava/lang/reflect/Field;
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v7

    const-class v8, Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 171
    :try_start_1
    iget-object v7, p0, Lorg/eclipse/jgit/nls/TranslationBundle;->resourceBundle:Ljava/util/ResourceBundle;

    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 172
    .local v6, translatedText:Ljava/lang/String;
    invoke-virtual {v3, p0, v6}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/util/MissingResourceException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_3

    .line 168
    .end local v6           #translatedText:Ljava/lang/String;
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 163
    .end local v0           #arr$:[Ljava/lang/reflect/Field;
    .end local v3           #field:Ljava/lang/reflect/Field;
    .end local v4           #i$:I
    .end local v5           #len$:I
    :catch_0
    move-exception v2

    .line 164
    .local v2, e:Ljava/util/MissingResourceException;
    new-instance v7, Lorg/eclipse/jgit/errors/TranslationBundleLoadingException;

    invoke-direct {v7, v1, p1, v2}, Lorg/eclipse/jgit/errors/TranslationBundleLoadingException;-><init>(Ljava/lang/Class;Ljava/util/Locale;Ljava/lang/Exception;)V

    throw v7

    .line 173
    .end local v2           #e:Ljava/util/MissingResourceException;
    .restart local v0       #arr$:[Ljava/lang/reflect/Field;
    .restart local v3       #field:Ljava/lang/reflect/Field;
    .restart local v4       #i$:I
    .restart local v5       #len$:I
    :catch_1
    move-exception v2

    .line 174
    .restart local v2       #e:Ljava/util/MissingResourceException;
    new-instance v7, Lorg/eclipse/jgit/errors/TranslationStringMissingException;

    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v1, p1, v8, v2}, Lorg/eclipse/jgit/errors/TranslationStringMissingException;-><init>(Ljava/lang/Class;Ljava/util/Locale;Ljava/lang/String;Ljava/lang/Exception;)V

    throw v7

    .line 175
    .end local v2           #e:Ljava/util/MissingResourceException;
    :catch_2
    move-exception v2

    .line 176
    .local v2, e:Ljava/lang/IllegalArgumentException;
    new-instance v7, Ljava/lang/Error;

    invoke-direct {v7, v2}, Ljava/lang/Error;-><init>(Ljava/lang/Throwable;)V

    throw v7

    .line 177
    .end local v2           #e:Ljava/lang/IllegalArgumentException;
    :catch_3
    move-exception v2

    .line 178
    .local v2, e:Ljava/lang/IllegalAccessException;
    new-instance v7, Ljava/lang/Error;

    invoke-direct {v7, v2}, Ljava/lang/Error;-><init>(Ljava/lang/Throwable;)V

    throw v7

    .line 182
    .end local v2           #e:Ljava/lang/IllegalAccessException;
    .end local v3           #field:Ljava/lang/reflect/Field;
    :cond_1
    return-void
.end method

.method public resourceBundle()Ljava/util/ResourceBundle;
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lorg/eclipse/jgit/nls/TranslationBundle;->resourceBundle:Ljava/util/ResourceBundle;

    return-object v0
.end method
