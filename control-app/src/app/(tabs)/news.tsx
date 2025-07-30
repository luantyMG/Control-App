import React, { useState, useCallback } from 'react';
import { FlatList, StyleSheet, ActivityIndicator } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import NewsCard from '../../components/NewsCard/NewsCard';
import newsData from '../../data/newsData';
import { useTheme } from '../../context/ThemeContext/ThemeContext';
import { StatusBar } from 'expo-status-bar';
import TabsLayoutWrapper from '../../components/TabsLayoutWrapper/TabsLayoutWrapper';

const PAGE_SIZE = 5;

export default function NewsScreen() {
  const { colors } = useTheme();

  const [page, setPage] = useState(1);
  const [refreshing, setRefreshing] = useState(false);
  const [data, setData] = useState(newsData.slice(0, PAGE_SIZE));

  const loadMore = () => {
    const nextPage = page + 1;
    const newData = newsData.slice(0, nextPage * PAGE_SIZE);
    if (newData.length !== data.length) {
      setData(newData);
      setPage(nextPage);
    }
  };

  const onRefresh = useCallback(() => {
    setRefreshing(true);
    setTimeout(() => {
      setData(newsData.slice(0, PAGE_SIZE));
      setPage(1);
      setRefreshing(false);
    }, 1500);
  }, []);

  return (
    <TabsLayoutWrapper>
      <SafeAreaView style={[styles.container, { backgroundColor: colors.background }]}>
        <StatusBar style={colors.background === '#121212' ? 'light' : 'dark'} />
        <FlatList
          data={data}
          keyExtractor={(item) => item.id.toString()}
          renderItem={({ item }) => (
            <NewsCard
              avatarUrl={item.avatarUrl}
              title={item.title}
              date={item.date}
              description={item.description}
              imageUrl={item.imageUrl}
            />
          )}
          contentContainerStyle={{
            paddingTop: 10,
            paddingBottom: 20,
          }}
          onEndReached={loadMore}
          onEndReachedThreshold={0.5}
          refreshing={refreshing}
          onRefresh={onRefresh}
          ListFooterComponent={() =>
            data.length < newsData.length ? (
              <ActivityIndicator size="large" color={colors.primary} />
            ) : null
          }
        />
      </SafeAreaView>
    </TabsLayoutWrapper>

  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
});
